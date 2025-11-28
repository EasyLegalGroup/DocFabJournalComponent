import { api, LightningElement, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import LEAD_FIELD from '@salesforce/schema/Journal__c.Lead__c';

import getJournalData_Apex from '@salesforce/apex/DFJ_JournalForm.getJournalData_Apex';
import journalAssociatedWithLead from '@salesforce/apex/DFJ_JournalForm.journalAssociatedWithLead';

export default class DFJ_JournalFormComponent extends LightningElement {
    @api recordId;
    @api objectApiName;

    @api recordModelId;
    @api formUuid;
    @api formTypeUniqueName; // DEPRECATED - kept for backwards compatibility with existing page layouts
    @api allowMultipleDocFabJournals = false;
    @api openBehavior = 'modal'; // modal | newTab | inline
    isJournalFormClicked = true;
    docFabFormUrl;
    isShowFormInModal = false;
    isShowInline = false;
    isInitialized = false;
    relatedLeadId;
    isFetchingForm = false;
    isIframeLoading = false;
    selectionOptions = [];
    isSelectionModalOpen = false;

    get isFormLoading() {
        return this.isFetchingForm || this.isIframeLoading;
    }

    get shouldRenderInlineArea() {
        return this.openBehavior === 'inline' && (this.isShowInline || this.isFormLoading);
    }

    get journalRecordId() {
        return this.objectApiName === 'Journal__c' ? this.recordId : null;
    }

    @wire(getRecord, {
        recordId: '$journalRecordId',
        fields: [LEAD_FIELD],
    })
    fieldsData({ data }) {
        if (data) {
            this.relatedLeadId = getFieldValue(data, LEAD_FIELD);
        }
    }

    async handleOpenJournalFormButtonClick() {
        if (this.isFormLoading) {
            return;
        }

        if (!this.isInitialized) {
            this.isFetchingForm = true;
            try {
                await this.handleGetJournalData(true);
            } finally {
                this.isFetchingForm = false;
            }
            return;
        }

        const isCurrentlyVisible =
            this.openBehavior === 'inline' ? this.isShowInline : this.isShowFormInModal;

        if (isCurrentlyVisible) {
            this.toggleVisibility();
            return;
        }

        this.isIframeLoading = true;
        this.toggleVisibility(true);
    }

    get buttonLabel() {
        if (this.isFormLoading) {
            return 'Loading Journal Form...';
        }
        return this.baseButtonLabel;
    }

    get buttonAriaLabel() {
        return this.buttonLabel;
    }

    get buttonIconName() {
        return this.isFormLoading ? null : 'utility:edit_form';
    }

    get baseButtonLabel() {
        if (this.openBehavior === 'newTab') {
            return 'Open Journal Form';
        }
        const isShowing = this.openBehavior === 'inline' ? this.isShowInline : this.isShowFormInModal;
        if (!this.isInitialized) {
            return 'Open Journal Form';
        }
        return isShowing ? 'Hide Journal Form' : 'Show Journal Form';
    }

    async handleGetJournalData(forceShow = false) {
        try {
            let journalId = this.recordId;
            let leadId = this.relatedLeadId;

            const isLeadContext = this.objectApiName === 'Lead';
            if (isLeadContext) {
                leadId = this.recordId;
                const journals = await journalAssociatedWithLead({ recordId: this.recordId });
                if (!journals || !journals.length) {
                    this.showToast('Error opening journal', 'No journal found or created for this lead.', 'error');
                    return;
                }
                journalId = journals[0].Id;
            }

            const response = await getJournalData_Apex({
                JournalId: journalId,
                contextRecordId: leadId,
                objectName: this.objectApiName || 'Journal__c',
                journlaFormClicked: this.isJournalFormClicked,
                componentRecordModelId: this.recordModelId,
                componentFormUuid: this.formUuid,
                componentFormTypeName: null,
                allowMultipleDocFabJournals: this.allowMultipleDocFabJournals,
            });

            const options = (response && response.docFabOptions) || [];
            const requiresSelection = response && response.requiresSelection;
            let docFabUrl = response && response.docFabUrl;

            if (!docFabUrl && options.length === 1) {
                docFabUrl = options[0].url;
            }

            if (requiresSelection && options.length > 1) {
                this.selectionOptions = options;
                this.isSelectionModalOpen = true;
                this.isInitialized = true;
                this.isIframeLoading = false;
                return;
            }

            if (!docFabUrl) {
                this.showToast('Error opening journal', 'DocFab URL not available for this record.', 'error');
                this.isShowFormInModal = false;
                return;
            }

            if (this.isDocFabError(docFabUrl)) {
                this.showToast('Error opening journal', docFabUrl, 'error');
                this.isShowFormInModal = false;
                return;
            }

            this.selectionOptions = [];
            this.isSelectionModalOpen = false;
            this.docFabFormUrl = docFabUrl;
            this.isInitialized = true;
            this.isIframeLoading = this.openBehavior !== 'newTab';
            this.toggleVisibility(forceShow || this.openBehavior === 'newTab');
        } catch (error) {
            const message = (error && error.body && error.body.message) || error.message || 'Unexpected error';
            this.showToast('Error opening journal', message, 'error');
            this.isShowFormInModal = false;
        }
    }

    toggleVisibility(forceShow = false) {
        if (!this.docFabFormUrl) {
            return;
        }

        if (this.openBehavior === 'newTab') {
            window.open(this.docFabFormUrl, '_blank');
            this.isShowFormInModal = false;
            this.isShowInline = false;
            this.isIframeLoading = false;
        } else if (this.openBehavior === 'inline') {
            const shouldShow = forceShow ? true : !this.isShowInline;
            this.isShowInline = shouldShow;
            this.isShowFormInModal = false;
            this.isIframeLoading = shouldShow ? this.isIframeLoading : false;
        } else {
            const shouldShow = forceShow ? true : !this.isShowFormInModal;
            this.isShowFormInModal = shouldShow;
            this.isShowInline = false;
            this.isIframeLoading = shouldShow ? this.isIframeLoading : false;
        }
    }

    handleCloseModal() {
        this.isShowFormInModal = false;
        this.isIframeLoading = false;
    }

    handleSelectionModalClose() {
        this.isSelectionModalOpen = false;
        this.selectionOptions = [];
    }

    handleSelectOption(event) {
        const url = event.target.dataset.url;
        if (!url) {
            return;
        }
        this.docFabFormUrl = url;
        this.isSelectionModalOpen = false;
        this.selectionOptions = [];
        this.isInitialized = true;
        this.isIframeLoading = this.openBehavior !== 'newTab';
        this.toggleVisibility(true);
    }

    handleIframeLoad() {
        this.isIframeLoading = false;
    }

    isDocFabError(url) {
        const errorSnippets = [
            'Current user with',
            'No form configuration found',
            'Can not open',
            'Can not create',
            'Error',
            'Market Unit Missing',
            'Record Model Id and Form Type cannot both be specified',
        ];
        return errorSnippets.some((snippet) => url.includes(snippet));
    }

    showToast(title, message, variant = 'info') {
        this.dispatchEvent(
            new ShowToastEvent({
                title,
                message,
                variant,
                mode: 'sticky',
            })
        );
    }
}
