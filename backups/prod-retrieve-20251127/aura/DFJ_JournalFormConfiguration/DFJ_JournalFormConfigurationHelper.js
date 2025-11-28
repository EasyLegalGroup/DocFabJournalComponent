({

    doInit_Helper: function (c, e, h) {
        try {
            h.showSpinner_Helper(c, e);
            let action = c.get("c.getAllJournalFormMetaData_Apex");
            //action.setParams({'DurationRange': c.get("v.DurationRange")});
            action.setCallback(this, function (r) {
                if (r.getState() === 'SUCCESS') {
                    let storedResponse = r.getReturnValue();
                    if (storedResponse !== null && storedResponse !== undefined && storedResponse !== '') {
                        c.set("v.productsList", storedResponse);
                    }
                    h.hideSpinner_Helper(c, e);
                } else {
                    console.log('ERROR');
                    console.log(r.getError());
                    h.hideSpinner_Helper(c, e);
                }
            });
            $A.enqueueAction(action);
        } catch (ex) {
            console.log('Error in fetching the user ---' + ex);
            h.hideSpinner_Helper(c, e);
        }
    },

    getProductConfiguration_Helper: function (c, e, h) {
        try {
            h.showSpinner_Helper(c, e);
            let productId = c.get("v.selectedProductId");
            let action = c.get("c.getProductMetadata_Apex");
            action.setParams({'productId': c.get("v.selectedProductId")});
            action.setCallback(this, function (r) {
                if (r.getState() === 'SUCCESS') {
                    let storedResponse = r.getReturnValue();
                    if (storedResponse !== null && storedResponse !== undefined && storedResponse !== '') {
                        let allMetaProductJournalMetaDataList = storedResponse.allMetaProductJournalMetaDataList;
                        allMetaProductJournalMetaDataList.forEach(function (ele) {
                            ele.journalSection.isVisible = true;
                            if (ele.allJournalFields !== null && ele.allJournalFields !== undefined && ele.allJournalFields !== '') {
                                ele.allJournalFields.forEach(function (elein) {
                                    elein.isVisible = true;
                                });
                            }
                        });

                        let preConfiguredJournalList = [];
                        let selectedSectionObj = {};
                        let journalConfigurationList = storedResponse.journalConfigurationList;

                        // Empty set to get all the section
                        let testAraay = new Set();

                        // Add all the section id in the set
                        if (!$A.util.isEmpty(journalConfigurationList)) {
                            journalConfigurationList.forEach(function (ele) {
                                testAraay.add(ele.Journal_Section__c);
                            });
                        }


                        // Add each configuration to the desired sections.
                        if (!$A.util.isEmpty(testAraay)) {
                            testAraay.forEach(function (ele) {
                                let sampleObj = {};
                                sampleObj.selctionId = ele;
                                sampleObj.selctedFields = [];
                                preConfiguredJournalList.push(sampleObj);
                            });
                        }

                        if (journalConfigurationList !== null && journalConfigurationList !== undefined && journalConfigurationList !== '') {
                            journalConfigurationList.forEach(function (ele) {
                                preConfiguredJournalList.forEach(function (eleIn) {
                                    if (eleIn.selctionId === ele.Journal_Section__c) {
                                        eleIn.Name = ele.Journal_Section__r.Name;
                                        eleIn.selctionId = ele.Journal_Section__c;
                                        eleIn.fieldPicklistValue = '';
                                        let fieldAddObj = {};
                                        fieldAddObj.Id = ele.Journal_Field__c;
                                        fieldAddObj.Name = ele.Journal_Field__r.Name;
                                        fieldAddObj.isMandatory = ele.Mandatory__c;
                                        fieldAddObj.configId = ele.Id;
                                        eleIn.selctedFields.push(fieldAddObj);
                                        eleIn.allJournalFields = ele.allJournalFields;
                                        eleIn.isVisible = false;
                                    }
                                });
                            });
                        }

                        allMetaProductJournalMetaDataList.forEach(function (ele) { // It contains all the data in the system for Journal fields
                            preConfiguredJournalList.forEach(function (eleIn) { // It contains saved previous selected fields
                                if (ele.journalSection.Id === eleIn.selctionId){
                                    // Change the visibility of the
                                    ele.journalSection.isVisible = false;
                                    if (ele.allJournalFields !== null && ele.allJournalFields !== undefined && ele.allJournalFields !== '') {
                                        if (eleIn.selctedFields !== null && eleIn.selctedFields !== undefined && eleIn.selctedFields !== '') {
                                            eleIn.allJournalFields = ele.allJournalFields; // All all the selected values to the selected fields list
                                            // Comparision between the fields which are previously selected so we can hide the visibility
                                            eleIn.allJournalFields.forEach(function (eleJour) {
                                                eleIn.selctedFields.forEach(function (eleSele) {
                                                    if (eleJour.Id === eleSele.Id) {
                                                        // If both the ids are same then it should hide from the selected fields
                                                        eleJour.isVisible = false;
                                                    }
                                                });
                                            });
                                        }
                                    }
                                }
                            });
                        });

                        c.set("v.sectionList", preConfiguredJournalList);
                        c.set("v.allSectionList", allMetaProductJournalMetaDataList);

                    }
                    h.hideSpinner_Helper(c, e);
                } else {
                    console.log('ERROR');
                    console.log(r.getError());
                    h.hideSpinner_Helper(c, e);
                }
            });
            $A.enqueueAction(action);
        } catch (ex) {
            console.log('Error in fetching the user ---' + ex);
            h.hideSpinner_Helper(c, e);
        }
    },

    getAllSections_Helper: function (c, e, h) {
        c.set("v.showSectionList", true);
    },

    cancelButton_helper: function (c, e, h) {
        c.set("v.showSectionList", false);
    },

    showSpinner_Helper: function (c, e) {
        c.set("v.isSpinnerOpen", true);
        window.setTimeout(
            $A.getCallback(function () {
                c.set("v.isSpinnerOpen", false);
            }), 2500
        );
    },
    hideSpinner_Helper: function (c, e) {
        c.set("v.isSpinnerOpen", false);
    },

    AddSectionToList_helper: function (c, e, h) {
        let selectedSection = c.get("v.selectedSection");
        let tabIndex = e.getSource().get("v.tabindex");
        let sectionListJS = c.get("v.sectionList");
        let selectedSectionName = {};
        let sectionList = c.get("v.allSectionList");
        if (selectedSection !== null && selectedSection !== undefined && selectedSection !== '') {
            if (sectionList !== null && sectionList !== undefined && sectionList !== '') {
                sectionList.forEach(function (ele) {
                    if (selectedSection === ele.journalSection.Id) {
                        selectedSectionName.Name = ele.journalSection.Name;
                        selectedSectionName.selctionId = ele.journalSection.Id;
                        selectedSectionName.fieldPicklistValue = '';
                        selectedSectionName.selctedFields = [];
                        selectedSectionName.allJournalFields = ele.allJournalFields;
                        ele.journalSection.isVisible = false; // change the visibility to remove from the list
                    }
                });
                if (sectionListJS !== null || sectionListJS !== undefined || sectionListJS.trim() !== '' && !$A.util.isUndefinedOrNull(selectedSectionName)) {
                    sectionListJS.push(selectedSectionName);
                    c.set("v.sectionList", sectionListJS);
                    c.set("v.selectedSection", '');
                } else if ($A.util.isUndefinedOrNull(sectionListJS) && !$A.util.isUndefinedOrNull(selectedSectionName)) {
                    sectionListJS = [];
                    sectionListJS.push(selectedSectionName);
                    c.set("v.sectionList", sectionListJS);
                    c.set("v.selectedSection", '');
                }
                c.set("v.allSectionList", sectionList);
            }
        }
    },

    addFieldToList_helper: function (c, e, h) {
        let tabIndex = e.getSource().get("v.tabindex");
        let fieldList = c.get("v.allFieldList");
        let sectionList = c.get("v.sectionList");
        let fieldObj = [];
        sectionList[tabIndex].allJournalFields.forEach(function (ele) {
            if (sectionList[tabIndex].fieldPicklistValue === ele.Id) {
                let samplObj = {};
                samplObj.Id = ele.Id;
                samplObj.Name = ele.Name;
                samplObj.isMandatory = false;
                sectionList[tabIndex].selctedFields.push(samplObj);
                ele.isVisible = false;
                //sectionList[tabIndex].selctedFields = ele.Name;
            }
        });
        sectionList[tabIndex].fieldPicklistValue = '';
        // sectionList[tabIndex].allJournalFields = fieldObj;
        c.set("v.sectionList", sectionList);
    },



    saveData_helper: function (c, e, h) {
        let productId = c.get("v.selectedProductId");
        let sections = c.get("v.sectionList");
        let sectionList = c.get("v.sectionList");
        let configToDelete = c.get("v.configToDelete");
        let sectionsId = [];
        let fieldsId = [];
        sections.forEach(function (ele) {
            sectionsId.push(ele.selctionId);
            ele.selctedFields.forEach(function (ele1) {
                fieldsId.push(ele1.Id);
            });
        });

        let JournalConfigurationList = c.get("v.JournalConfigurationList");

        sectionList.forEach(function (ele) {
            if (ele.selctedFields !== null && ele.selctedFields !== undefined && ele.selctedFields !== '') {
                ele.selctedFields.forEach(function (eleIn) {
                    let journalCOnfigObj = {};
                    journalCOnfigObj.Journal_Field__c = eleIn.Id;
                    journalCOnfigObj.Journal_Section__c = ele.selctionId;
                    journalCOnfigObj.Product__c = c.get("v.selectedProductId");
                    journalCOnfigObj.Mandatory__c = eleIn.isMandatory;
                    journalCOnfigObj.Id = eleIn.configId;
                    JournalConfigurationList.push(journalCOnfigObj);
                });
            }
        });
        let configToDeleteSet = new Set(configToDelete);
        let configToDeleteList = [];
        configToDeleteSet.forEach(function (ele) {
            configToDeleteList.push(ele);
        });

        try {
            let action = c.get("c.insertSectionANdField_Apex");
            action.setParams({
                'JournalConfigurationListString': JSON.stringify(JournalConfigurationList),
                'configToDeleteSetString': JSON.stringify(configToDeleteList)
            });
            action.setCallback(this, function (response) {
                if (response.getState() === 'SUCCESS') {
                    let storedResponse = response.getReturnValue();
                    //h.hideSpinner_Helper(c, e);
                    h.showSuccessToast(c,e,h);
                    $A.get('e.force:refreshView').fire();
                } else {
                    h.showErrorToast(c,e,h);
                    console.log('ERROR');
                    console.log(response.getError());
                    // h.hideSpinner_Helper(c, e);
                }
            });
            $A.enqueueAction(action);
            h.validateAllFields(c,e,h);
        } catch (ex) {
            console.info("Error" + ex.message);
        }
    },

    showSuccessToast: function (c, e, h) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title: 'Success',
            message: 'Saved successfully',
            messageTemplate: 'Saved Successfully!',
            duration: ' 5000',
            key: 'info_alt',
            type: 'success',
            mode: 'pester'
        });
        toastEvent.fire();
    },

    showErrorToast: function (component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title: 'Error Message',
            message: 'An error has occured while saving the record',
            messageTemplate: 'An error has occured while saving the record',
            duration: ' 5000',
            key: 'info_alt',
            type: 'error',
            mode: 'pester'
        });
        toastEvent.fire();
    },

    deleteSection_helper: function (c, e, h) {
        let configToDelete = c.get("v.configToDelete");
        let tabIndex = e.getSource().get("v.tabindex");
        let allSectionList = c.get("v.allSectionList");
        let sectionList = c.get("v.sectionList");
        let selectedIndex = sectionList[tabIndex].selctionId;
        allSectionList.forEach(function (ele) {
            if (selectedIndex === ele.journalSection.Id) {
                ele.journalSection.isVisible = true;
            }
        });

        sectionList.forEach(function (ele) {
            if (selectedIndex === ele.selctionId) {
                ele.selctedFields.forEach(function (eleIn) {
                    if (eleIn.configId !== null && eleIn.configId !== undefined){
                        configToDelete.push(eleIn.configId);
                    }
                });
            }
        });

        sectionList.splice(tabIndex, 1);
        c.set("v.sectionList", sectionList);
        c.set("v.allSectionList", allSectionList);
        c.set("v.configToDelete",configToDelete);
    },

    deleteField_helper: function (c, e, h) {
        let configToDelete = c.get("v.configToDelete");
        let tabIndexOfList = e.getSource().get("v.tabindex");
        let tabIndexOfSection = e.getSource().get("v.name");
        let sectionList = c.get("v.sectionList");
        let selectedField = sectionList[tabIndexOfSection].selctedFields[tabIndexOfList].Id;

        sectionList[tabIndexOfSection].allJournalFields.forEach(function (ele) {
            if (selectedField === ele.Id) {
                ele.isVisible = true;
            }
        });
        sectionList[tabIndexOfSection].selctedFields.forEach(function (ele) {
            if (selectedField === ele.Id) {
                ele.isVisible = true;
                if (ele.configId !== null && ele.configId !== undefined){
                    configToDelete.push(ele.configId);
                }
            }
        });

        sectionList[tabIndexOfSection].selctedFields.splice(tabIndexOfList, 1);
        c.set("v.sectionList", sectionList);
        c.set("v.configToDelete",configToDelete);
        console.log(configToDelete);
    },

})