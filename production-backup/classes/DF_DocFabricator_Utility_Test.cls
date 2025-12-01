@isTest
public with sharing class DF_DocFabricator_Utility_Test {
    
    @isTest
    private static void GetRecordFormConfigurationMetadataRecord_Apex_test(){
        List<Journal__c> jouTestInsNoRec = new List <Journal__c>{new Journal__c(Market_Unit__c='FA_SE',Type__c='Inheritance')};
        insert jouTestInsNoRec;
        Test.startTest();
        // Changes for ticket - DIN-169 : Create DocFab Record.
	    // Start
	    // Description : Covering else part of GetRecordFormConfigurationMetadataRecord_Apex method.
        List<Record_form_configuration__mdt> metaDataListNull = DF_DocFabricator_Utility.GetRecordFormConfigurationMetadataRecord_Apex('Test',jouTestInsNoRec[0].Id,'Inheritance');
        List<Record_form_configuration__mdt> metaDataListmarketNull = DF_DocFabricator_Utility.GetRecordFormConfigurationMetadataRecord_Apex('',jouTestInsNoRec[0].Id,'Inheritance');
        // End
        Test.stopTest();
        System.assertEquals(null, metaDataListNull);
        System.assertEquals(null, metaDataListmarketNull);
    }

    @isTest
    private static void AuthenticateCurrentSalesforceUserNegative_Apex_Test(){
        List<Journal__c> jouTestInsNoRec = new List <Journal__c>{new Journal__c(Market_Unit__c='FA_SE',Type__c='Inheritance')};
        insert jouTestInsNoRec;
        Test.startTest();
        // Changes for ticket - DIN-170 : Create DocFab Record.
	    // Start
	    // Description : Catch code coverage
        String recordUuidOrError = DF_DocFabricator_Utility.AuthenticateCurrentSalesforceUser_Apex('10', jouTestInsNoRec);
        // End
        Test.stopTest();
        System.assertEquals(null, recordUuidOrError);
    }

    @isTest
    private static void AuthenticateCurrentSalesforceUserServerError_Apex_Test(){
        Doc_Fabricator_Setting__c APIKeyInstance = new Doc_Fabricator_Setting__c();
        APIKeyInstance.API_Key__c = 'M0mOH7wOd5PZkGsDTH8qcOwPBOK7K5';
        insert APIKeyInstance;
        List<Journal__c> jouTestInsNoRec = new List <Journal__c>{new Journal__c(Market_Unit__c='FA_SE',Type__c='Inheritance')};
        insert jouTestInsNoRec;
        Test.startTest();
        // Changes for ticket - DIN-170 : Create DocFab Record.
	    // Start
	    // Description : Covering the responsecode condition else
        String recordUuidOrError = DF_DocFabricator_Utility.AuthenticateCurrentSalesforceUser_Apex('10', jouTestInsNoRec);
        // End
        Test.stopTest();
        System.assertEquals(null, recordUuidOrError);
    }

  
    @isTest
    private static void CreateRecordToOpenDocFab_Apex_Test(){
        Doc_Fabricator_Setting__c APIKeyInstance = new Doc_Fabricator_Setting__c();
        APIKeyInstance.API_Key__c = 'M0mOH7wOd5PZkGsDTH8qcOwPBOK77I';
        insert APIKeyInstance;
        List<Journal__c> jouTestInsNoRec = new List <Journal__c>{new Journal__c(Market_Unit__c='FA_SE',Type__c='Inheritance')};
        insert jouTestInsNoRec;
        Test.startTest();
        // Changes for ticket - DIN-170 : Create DocFab Record.
	    // Start
	    // Description : first two parameter(record_model_id, user_id) is empty so return null.
        Test.setMock(HttpCalloutMock.class, new DF_MockTestUtility_Apex());
        String recordUuidOrErrorTwo = DF_DocFabricator_Utility.CreateRecordToOpenDocFab_Apex('', '', jouTestInsNoRec);
        // End
        Test.stopTest();
        System.assertEquals(null, recordUuidOrErrorTwo);
    }

    @isTest
    private static void CreateRecordToOpenDocFabServerError_Apex_Test(){
        Doc_Fabricator_Setting__c APIKeyInstance = new Doc_Fabricator_Setting__c();
        APIKeyInstance.API_Key__c = 'M0mOH7wOd5PZkGsDTH8qcOwPBOK77K5';
        insert APIKeyInstance;
        List<Journal__c> jouTestInsNoRec = new List <Journal__c>{new Journal__c(Market_Unit__c='FA_SE',Type__c='Inheritance')};
        insert jouTestInsNoRec;
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new DF_MockTestUtility_Apex());
        // Changes for ticket - DIN-170 : Create DocFab Record.
	    // Start
	    // Description : first two parameter(record_model_id, user_id) is empty so return null.
        String recordUuidOrErrorTwo = DF_DocFabricator_Utility.CreateRecordToOpenDocFab_Apex('', '', jouTestInsNoRec);
        // End
        Test.stopTest();
        System.assertEquals(null, recordUuidOrErrorTwo);
    }

    @isTest
    private static void CreateRecordToOpenDocFabNegative_Apex_Test(){
        Doc_Fabricator_Setting__c APIKeyInstance = new Doc_Fabricator_Setting__c();
        APIKeyInstance.API_Key__c = 'M0mOH7wOd5PZkGsDTH8qcOwPBOK77K';
        insert APIKeyInstance;
        List<Journal__c> jouTestInsNoRec = new List <Journal__c>{new Journal__c(Market_Unit__c='FA_SE')};
        insert jouTestInsNoRec;
        Test.startTest();
        String recordUuidOrError = DF_DocFabricator_Utility.CreateRecordToOpenDocFab_Apex('1', '1', jouTestInsNoRec);
        Test.stopTest();
        System.assertEquals(null, recordUuidOrError);
    }

    @isTest
    private static void EscapeBodyNegative_Apex_Test(){
        Test.startTest();
        String recordUuidOrError1 = DF_DocFabricator_Utility.EscapeReversedCharacters_Apex('sa\'');
        String recordUuidOrError2 = DF_DocFabricator_Utility.EscapeReversedCharacters_Apex(null);
        Test.stopTest();
        System.assertEquals('', recordUuidOrError2);
    }

    @isTest
    private static void CreateDocfabModelPicklistItem_Test(){
        DF_DocFabricator_Utility.RequestBodyPayloadWrapper newInstance = new DF_DocFabricator_Utility.RequestBodyPayloadWrapper();
        newInstance.record_model = null;
        Test.startTest();
        DF_DocFabricator_Utility.ResponseReturnWrapper  resIns = DF_DocFabricator_Utility.CreateDocfabModelPicklistItem(newInstance);
        Test.stopTest();
        System.assertEquals(500, resIns.statuscode);
    }

    @isTest
    private static void CreateReturnResponse_Test(){
        DF_DocFabricator_Utility.RequestBodyPayloadWrapper newInstance = new DF_DocFabricator_Utility.RequestBodyPayloadWrapper();
        newInstance.record_model = null;
        Test.startTest();
        DF_DocFabricator_Utility.ResponseReturnWrapper  resIns = DF_DocFabricator_Utility.CreateReturnResponse(null, 500);
        Test.stopTest();
        System.assertEquals(500, resIns.statuscode);
    }
}