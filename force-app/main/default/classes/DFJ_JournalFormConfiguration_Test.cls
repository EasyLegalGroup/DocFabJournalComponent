/**
 * Created by shubh on 23-09-2019.
 */
@isTest
public with sharing class DFJ_JournalFormConfiguration_Test {

    @isTest
    private static void getAllJournalFormMetaData_Apex_Test(){
        Product2 productInstance =new Product2();
        productInstance.Name='test';
        productInstance.productCode='1234';
        productInstance.isActive = true;
        productInstance.For_Promotion__c = true;
        insert productInstance;

        List<Journal_Section__c> journal_sections = new List<Journal_Section__c>();
        Journal_Section__c jsObj = new Journal_Section__c();
        jsObj.Name = 'Test Section';
        jsObj.Unique_Name__c = 'Test Unique Name';
        journal_sections.add(jsObj);
        insert journal_sections;

        Journal_Field__c jfObj = new Journal_Field__c();
        jfObj.Name = 'Test Field';
        jfObj.Journal_Section__c = journal_sections[0].Id;
        jfObj.Unique_Name__c = 'Test Unique Name';
        insert jfObj;

        Journal_Configuration__c jcObj = new Journal_Configuration__c();
        jcObj.Journal_Field__c = jfObj.Id;
        jcObj.Journal_Section__c = journal_sections[0].Id;
        jcObj.Mandatory__c = true;
        jcObj.Product__c = productInstance.Id;
        insert jcObj;

        List<Journal_Configuration__c> journalConfigurationsList = new List<Journal_Configuration__c>();
        Journal_Configuration__c jcObj2 = new Journal_Configuration__c();
        jcObj2.Journal_Field__c = jfObj.Id;
        jcObj2.Journal_Section__c = journal_sections[0].Id;
        jcObj2.Mandatory__c = true;
        jcObj2.Product__c = productInstance.Id;
        journalConfigurationsList.add(jcObj2);

        Test.startTest();
        DFJ_JournalFormConfiguration_Apex.getAllJournalFormMetaData_Apex();
        DFJ_JournalFormConfiguration_Apex.getProductMetadata_Apex(productInstance.Id);
        DFJ_JournalFormConfiguration_Apex.insertSectionANdField_Apex(JSON.serialize(journalConfigurationsList), JSON.serialize(new List<String>{jcObj.Id}));
        Test.stopTest();

    }

}