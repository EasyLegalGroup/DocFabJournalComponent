/**
 * Created by shubh on 21-08-2019.
 */

public with sharing class DFJ_JournalFormConfiguration_Apex {

    @AuraEnabled
    public static List<Product2> getAllJournalFormMetaData_Apex() {

        List<Product2> product2List = new List<Product2>();
        product2List = [SELECT Id,Name FROM Product2 WHERE IsActive = true LIMIT 500];
        return product2List;
    }

    @AuraEnabled
    public static journalFormProductResponseWrapper getProductMetadata_Apex(String productId) {

        List<Journal_Section__c> journal_sections = new List<Journal_Section__c>();
        journal_sections = [SELECT Id,Name FROM Journal_Section__c LIMIT 500];
        System.debug('journal_sections---'+journal_sections);

        List<Journal_Field__c> journal_field = new List<Journal_Field__c>();
        journal_field = [SELECT Id,Name,Journal_Section__c,Unique_Name__c From Journal_Field__c Where Journal_Section__c != NULL Limit 500];
        System.debug('journal_field---'+journal_field);

        Map<Id,List<Journal_Field__c>>  sectionVSFieldMap = new Map<Id, List<Journal_Field__c>>();
        for(Journal_Field__c jf:journal_field){
            if(!sectionVSFieldMap.containsKey(jf.Journal_Section__c)){
                sectionVSFieldMap.put(jf.Journal_Section__c,new List<Journal_Field__c>());
            }
            sectionVSFieldMap.get(jf.Journal_Section__c).add(jf);
        }

        System.debug('sectionVSFieldMAp---'+sectionVSFieldMap);
        List<Journal_Configuration__c> journalConfigurationList = new List<Journal_Configuration__c>();
        journalConfigurationList = [SELECT Id,Name,Journal_Field__r.Name,Journal_Field__c,Journal_Section__c,Journal_Section__r.Name,Product__c,Visible__c,Mandatory__c FROM Journal_Configuration__c WHERE Product__c = :productId];

        System.debug('journalCOnfigurationList---'+journalConfigurationList);
        List<allMetaProductJournalMetaData> allMetaProductJournalMetaDataList = new List<allMetaProductJournalMetaData>();
        for (Journal_Section__c jsec : journal_sections){
            allMetaProductJournalMetaData metaDataInstance = new allMetaProductJournalMetaData();
            metaDataInstance.journalSection = jsec;
            metaDataInstance.allJournalFields = sectionVSFieldMap.get(jsec.Id);
            allMetaProductJournalMetaDataList.add(metaDataInstance);
        }

        journalFormProductResponseWrapper journalFormWrapper = new journalFormProductResponseWrapper();
        journalFormWrapper.allMetaProductJournalMetaDataList = allMetaProductJournalMetaDataList;
        journalFormWrapper.journalConfigurationList = journalConfigurationList;

        return journalFormWrapper;
		//return null;

    }

    public class journalFormProductResponseWrapper {
        @AuraEnabled public List<Journal_Configuration__c> journalConfigurationList;
        @AuraEnabled public List<allMetaProductJournalMetaData> allMetaProductJournalMetaDataList;
    }

    public class allMetaProductJournalMetaData {
        @AuraEnabled public Journal_Section__c journalSection;
        @AuraEnabled public List<Journal_Field__c> allJournalFields;
    }

    @AuraEnabled
    public static Boolean insertSectionANdField_Apex(String JournalConfigurationListString, String configToDeleteSetString){
        try {

            System.debug('configToDeleteSet--'+configToDeleteSetString);
            if (configToDeleteSetString != null && configToDeleteSetString.trim() != '') {
                List<String> configToDeleteList = new List<String>();
                configToDeleteList = (List<String>) JSON.deserialize(configToDeleteSetString,List<String>.class);
                System.debug(configToDeleteList);
                List<Journal_Configuration__c> JournalConfigurationListToDelete = new List<Journal_Configuration__c>();
                JournalConfigurationListToDelete = [SELECT Id FROM Journal_Configuration__c WHERE Id IN : configToDeleteList];

                if (!JournalConfigurationListToDelete.isEmpty()) {
                    delete JournalConfigurationListToDelete;
                }
            }

            if (JournalConfigurationListString != null && JournalConfigurationListString.trim() != '') {
                List<Journal_Configuration__c> JournalConfigurationList = new List<Journal_Configuration__c>();
                JournalConfigurationList = (List<Journal_Configuration__c>) JSON.deserialize(JournalConfigurationListString,List<Journal_Configuration__c>.class);

                if (!JournalConfigurationList.isEmpty()) {
                    upsert JournalConfigurationList;
                    return true;
                }
            }

        } catch (Exception ex){
            return false;
        }
        return false;
    }

}