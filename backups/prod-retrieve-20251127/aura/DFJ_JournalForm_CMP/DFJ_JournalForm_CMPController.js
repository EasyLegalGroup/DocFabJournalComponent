({
    doInit: function(c, e, h) {
        /*let objectName = c.get("v.sObjectName");
        if(objectName ===  'Journal__c'){
        if(objectName ===  'Journal__c'){
            let recordId = c.get("v.recordId");
            c.set("v.journalId",recordId);
            h.doInit_Helper(c,e,h);
        }else if(objectName === 'Lead'){
            let recordId = c.get("v.recordId");
            h.leadObject_helper(c,e,h,recordId);
        }


            let showHideSections = {};
            showHideSections.showHasChildren = false;
            showHideSections.showTypeOfChildren = false;
            showHideSections.showAllChirenAreAbove18 = false;
            showHideSections.showMarriageSection = false;
            showHideSections.showSpouse2Section = false;
            showHideSections.showGuradianSection = false;
            showHideSections.showChildrenSection = false;
            showHideSections.showEscrowConditionSection = false;
            showHideSections.showAllChildrenSection = false;
            showHideSections.showAllowEditOrRecallSection = true;
            showHideSections.showLastSurvivingSection = true;
            showHideSections.showCohabitingSection = false;
            showHideSections.showSpouse1AndSouse2Table = false;
            showHideSections.showMarriageDatePicklist = true ;
            showHideSections.showYearOfMarriage = false;
            showHideSections.showCohabitingYear = true;
            showHideSections.showYearOfCohabiting = false;
            showHideSections.showInheritanceFromFirstDeceased = true ;
            showHideSections.showInheritanceAsSingle = true ;

            c.set("v.showHideSections",showHideSections);*/
        h.onLoadOfPage(c, e, h);
        h.showJournaldataOnLead_helper(c, e, h);
    },
    handleSectionToggle: function(c, e, h) {
        var openSections = e.getParam('openSections');
        if (openSections.length === 0) {
            c.set('v.activeSectionsMessage', "All sections are closed");
        } else {
            c.set('v.activeSectionsMessage', "Open sections: " + openSections.join(', '));
        }
    },
    cancelSave: function(c, e, h) {
        let quickAction = c.get("v.ShowComponentButton");
        if (quickAction === true) {
            c.set("v.closeModal", false);
        } else {
            $A.get("e.force:closeQuickAction").fire();
            $A.get('e.force:refreshView').fire();
        }
    },
    saveJournalRecord: function(c, e, h) {
        h.insertData_helper(c, e, h);
    },

    copyChildrenInFutureProc: function(c, e, h) {
        h.copyChildrenInFutureProc_helper(c, e, h);
    },

    editChildData: function(c, e, h) {
        h.editChildData_Helper(c, e, h);
    },
    /*
        editChildDataOfSpouse2 : function (c,e,h) {
          h.editChildDataOfSpouse2_Helper(c,e,h);
        },
        editChildDataCommon : function (c,e,h) {
          h.editChildDataCommon_Helper(c,e,h);
        },
    */
    editAssetMoneyData: function(c, e, h) {
        h.editAssetMoneyData_helper(c, e, h);
    },

    editAssetThingData: function(c, e, h) {
        h.editAssetThingData_helper(c, e, h);
    },

    cancelChildRecordEdit: function(c, e, h) {
        c.set("v.childInstanceData", {});
        c.set("v.isChildModalOpen", false);
        c.set("v.IsInheritanceEditModal", false);
        c.set("v.IsFutureProcurationModal", false);
    },

    cancelAssetMoneyRecordEdit: function(c, e, h) {
        c.set("v.assetMoneyInstance", {});
        c.set("v.IsAssetMoneyEditMode", false);
    },

    cancelAssetThingRecordEdit: function(c, e, h) {
        c.set("v.assetThingInstance", {});
        c.set("v.IsAssetThingEditMode", false);
    },
    cancelGuardianRecordEdit: function(c, e, h) {
        c.set("v.guardianInstance", {});
        c.set("v.IsGuardianEditMode", false);
    },
    cancelUnwantedGuardianRecordEdit: function(c, e, h) {
        c.set("v.unwantedGuardianInstance", {});
        c.set("v.IsUnwantedGuardianEditMode", false);
    },

    saveChildData: function(c, e, h) {
        h.saveChildData_Helper(c, e, h);
    },

    saveChildDataProcurator: function() {
        h.saveChildDataProcurator_helper(c, e, h);
    },

    saveChildDataSpouse2: function(c, e, h) {
        //h.saveChildDataSpouse2_Helper(c,e,h);
    },
    saveChildCommonData: function(c, e, h) {
        //h.saveChildCommonData_Helper(c,e,h);
    },

    saveAssetMoneyData: function(c, e, h) {
        h.saveAssetMoneyData_helper(c, e, h);
    },

    saveAssetThingData: function(c, e, h) {
        h.saveAssetThingData_helper(c, e, h);
    },

    saveGuardianData: function(c, e, h) {
        h.saveGuardianData_helper(c, e, h);
    },
    saveUnwantedGuardianData: function(c, e, h) {
        h.saveUnwantedGuardianData_helper(c, e, h);
    },

    addNewChildToPersonList: function(c, e, h) {
        h.addNewChildToPersonList_Helper(c, e, h);
    },
    addNewGuardian: function(c, e, h) {
        h.addNewGuardian_Helper(c, e, h);
    },
    addNewUnwantedGuardian: function(c, e, h) {
        h.addNewUnwantedGuardian_Helper(c, e, h);
    },

    addNewAssetMoneyToPersonList: function(c, e, h) {
        h.addNewAssetMoneyToPersonList_helper(c, e, h);
    },

    addNewAssetThingToPersonList: function(c, e, h) {
        h.addNewAssetThingToPersonList_helper(c, e, h);
    },

    deleteChildRecord: function(c, e, h) {
        h.deleteChildRecord_helper(c, e, h);
    },
    deleteChildRecordOfSpouse2: function(c, e, h) {
        h.deleteChildRecordOfSpouse2_helper(c, e, h);
    },
    deleteChildRecordOfCommonChild: function(c, e, h) {
        h.deleteChildRecordOfCommonChild_helper(c, e, h);

    },

    deleteHeirRecord: function(c, e, h) {
        h.deleteHeirRecord_helper(c, e, h);
    },
    deleteHeir2Record: function(c, e, h) {
        h.deleteHeir2Record_helper(c, e, h);
    },
    deleteAssetMoneyRecord: function(c, e, h) {
        h.deleteAssetMoneyRecord_helper(c, e, h);
    },
    deleteAssetThingRecord: function(c, e, h) {
        h.deleteAssetThingRecord_helper(c, e, h);
    },

    deleteGuardianRecord: function(c, e, h) {
        h.deleteGuardianRecord_helper(c, e, h);
    },
    deleteUnwantedGuardianRecord: function(c, e, h) {
        h.deleteUnwantedGuardianRecord_helper(c, e, h);
    },
    download: function(c, e, h) {
        h.download_helper(c, e, h);
    },
    editGuardiandData: function(c, e, h) {
        h.editGuardiandData_helper(c, e, h);
    },
    editUnwantedGuardiandData: function(c, e, h) {
        h.editUnwantedGuardiandData_helper(c, e, h);
    },

    editHeir2: function(c, e, h) {
        h.editHeir2_helper(c, e, h);
    },
    editHeir: function(c, e, h) {
        h.editHeir_helper(c, e, h);
    },

    showSections: function(c, e, h) {
        h.showSections_helper(c, e, h);
    },

    addEditHeir: function(c, e, h) {
        h.addEditHeir_helper(c, e, h);
    },

    addEditHeir2: function(c, e, h) {
        h.addEditHeir2_helper(c, e, h);
    },

    cancelHierRecord: function(c, e, h) {
        c.set("v.IsHeirAddEdit", false);
    },
    cancelHier2Record: function(c, e, h) {
        c.set("v.IsHeir2AddEdit", false);
    },

    saveHeirRecord: function(c, e, h) {
        h.saveHeirRecord_helper(c, e, h);
    },

    saveHeir2Record: function(c, e, h) {
        h.saveHeir2Record_helper(c, e, h);
    },

    editInheritanceChildData: function(c, e, h) {
        h.editInheritanceChildData_helper(c, e, h);
    },
    heirPercentage: function(c, e, h) {
        h.heirPercentage_helper(c, e, h);
    },

    addnewprocuration: function(c, e, h) {
        c.set("v.IsFutureProcurationModal", true);
        let childdataprocuratorInstance = {};
        childdataprocuratorInstance.Is_Primary_P__c = 'Missing';
        c.set("v.childdataprocuratorInstance", childdataprocuratorInstance);
        //c.set("v.hasValue",false);
        c.set("v.disablePicklist", false);
        c.set("v.disableButton", false);
        h.getAllChilds_helper(c, e, h);
    },
    saveChildDataProcurator: function(c, e, h) {
        h.saveChildDataProcurator_helper(c, e, h);
    },

    editProcuratorData: function(c, e, h) {
        c.set('v.disablePicklist', true);
        c.set('v.disableButton', true);
        h.editProcuratorData_helper(c, e, h);
    },
    deleteProcuratorChildData: function(c, e, h) {
        h.deleteProcuratorChildData_helper(c, e, h);
    },

    copySpouse1Address: function(c, e, h) {
        h.copySpouse1Address_helper(c, e, h);
    },

    showJournalForm: function(c, e, h) {
        h.showJournalForm_helper(c, e, h);
    },

    updateFieldsOutsideForm: function(c, e, h) {
        h.updateFieldsOutsideForm_helper(c, e, h);
        //h.createRecordOfJournalHistory_helper(c,e,h);
    },

    showJournaldataOnLead: function(c, e, h) {
        h.showJournaldataOnLead_helper(c, e, h);
    },

    closeModal: function(c, e, h) {
        c.set("v.closeModal", false);
    },

    openModal: function(c, e, h) {
        let value = c.get('v.isModalOpen');
        if (value === false) {
            c.set('v.isModalOpen', true);
        } else if (value === true) {
            c.set('v.isModalOpen', false);
        }
    },

    createEventOnJournal: function(c, e, h) {
        h.validateEventData_Helper(c, e, h);
    },
    closeModel: function(c, e, h) {
        c.set('v.isTheLeadAndPersonValuesDifferent', false);
    },
    updateValues: function(c, e, h) {
        h.updateValues_helper(c, e, h);
    },
    validateFieldController: function(c, e, h) {
        h.validateField(c, e, h);
    },
    editDecimalValue: function(c, e, h) {
        try {
            let tabIndex = e.getSource().get("v.tabindex");
            let data = c.get('v.hierPersonData');
            if (data[tabIndex].Second_Percentage__c.include('.')) {
                data[tabIndex].Second_Percentage__c = data[tabIndex].Second_Percentage__c.replace('.', ',');
            }
            c.set('v.hierPersonData', data);
        } catch (ex) {
            console.log(`Error---${ex}`);
        }
    },

    // Changes for ticket DIN-197 : "Process document template feature"
    // Start
    processDocfabDocument: function(c, e, h) {
            try {
                h.processDocfabDocument_helper(c, e, h);
            } catch (e) {
                console.error(`Error---${ex}`);
            }
        }
        //End

})