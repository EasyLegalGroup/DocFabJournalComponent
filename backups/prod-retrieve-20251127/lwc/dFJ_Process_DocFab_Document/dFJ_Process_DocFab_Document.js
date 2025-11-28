import {LightningElement, wire, api} from 'lwc';
import {NavigationMixin} from 'lightning/navigation';

import getUrl from '@salesforce/apex/DFJ_ProcessDocFabDocument_Apex.getUrl'

export default class DFJ_Process_DocFab_Document extends NavigationMixin(LightningElement) {
    @api recordId;
    @api objectApiName;
    journalList = [];

    url='';

    get isUrlNotAvailable(){
        return !this.isUrlAvailable;
    }

    get isUrlAvailable(){
        return this.url && this.url.length > 0;
    }


    @wire(getUrl, {
        recordId: '$recordId',
        objectApiName: '$objectApiName'
    }) getUrlMethod(value) {
        const {data, error} = value;
        if (data) {
            this.url = data;
        }
        if (error) {
            console.error("🚀️ Error in ~ DFJ_Process_DocFab_Document ~ getUrlMethod() :", JSON.stringify(error));
        }
    }

    handleProcessDocFabDocumentButtonClick() {
        try {
            if (this.journalList) {
                const url = this.url;
                this[NavigationMixin.Navigate]({
                    type: 'standard__webPage',
                    attributes: {
                        url: url
                    }
                });
            }

        } catch (ex) {
            console.error('Error--' + ex);
        }


    }

}