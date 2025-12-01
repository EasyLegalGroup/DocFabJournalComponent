@isTest
public class TelegentaOutcomeHelper_Test {
    @testSetup static void setup(){
        Lead leadIns = new Lead();
        leadIns.Company='test';
        leadIns.LastName='test';
        leadIns.Status='Open';
        leadIns.Phone='+4512345678';
        leadIns.Provider_id__c = '1234567890';
        insert leadIns;
        
        telegenta__Outcome_Profile__c outcomeProfileInstance = new telegenta__Outcome_Profile__c();
        outcomeProfileInstance.Name = 'test';
        outcomeProfileInstance.telegenta__Object_name__c = 'Lead';
        insert outcomeProfileInstance;
        
        telegenta__Campaign__c campaignInstance = new telegenta__Campaign__c();
        campaignInstance.Name = 'Test';
        campaignInstance.telegenta__Outcome_profile__c = outcomeProfileInstance.Id;
        insert campaignInstance;
        
        telegenta__Outcome__c outcomeToInsert = new telegenta__Outcome__c();
        outcomeToInsert.Name = 'Test';
        outcomeToInsert.telegenta__Call_Outcome_Profile__c = outcomeProfileInstance.Id;
        outcomeToInsert.telegenta__Call_flow__c = true;
        insert outcomeToInsert;
        
        List<telegenta__Outcome_Field_Value__c> outcomeFieldValueList = new List<telegenta__Outcome_Field_Value__c>();
        telegenta__Outcome_Field_Value__c fieldValueIns = new telegenta__Outcome_Field_Value__c();
        fieldValueIns.telegenta__Outcome_Name__c = outcomeToInsert.Id;
        fieldValueIns.telegenta__Field_Name__c = 'telegenta__Last_Contact_State__c';
        fieldValueIns.telegenta__Field_Value__c = 'Got appointment';
        fieldValueIns.telegenta__Question__c = '';
        outcomeFieldValueList.add(fieldValueIns);
        insert outcomeFieldValueList;
        
        List<telegenta__Call_Campaign_State__c> callCampaignStateList = new List<telegenta__Call_Campaign_State__c>();
        telegenta__Call_Campaign_State__c callCampaignStateInstance = new telegenta__Call_Campaign_State__c();
        callCampaignStateInstance.telegenta__Lead__c = leadIns.Id;
        callCampaignStateInstance.telegenta__Call_Campaign__c = campaignInstance.Id;
        callCampaignStateInstance.telegenta__Unsuccessful_calls__c = 0;
        callCampaignStateInstance.telegenta__Has_appointment__c = false;
        callCampaignStateInstance.telegenta__Stop_Calling__c = false;
        callCampaignStateInstance.telegenta__Last_Call_Time__c = Datetime.now();
        callCampaignStateInstance.telegenta__Next_Call_Time__c = Datetime.now(); 
        callCampaignStateList.add(callCampaignStateInstance);
        insert callCampaignStateList;
        
        telegenta__Telegenta_Call_History__c callHistoryRecord = new telegenta__Telegenta_Call_History__c();
        callHistoryRecord.telegenta__Lead__c = leadIns.Id;
        callHistoryRecord.telegenta__Direction__c = 'OUTBOUND';
        insert callHistoryRecord;
    }
    
    @isTest
    public static void updateRecordAccount_Test(){
        RecordType personRecordType = [SELECT Id, Name from RecordType where SObjectType = 'Account' and Name ='Personkonto' LIMIT 1];
        RecordType businessRecordType = [SELECT Id, Name from RecordType where SObjectType = 'Account' and Name ='Business Account' LIMIT 1];
        
        Account personAccount = new Account();
        personAccount.FirstName = 'Test';
        personAccount.LastName = 'Account 1';
        personAccount.RecordTypeId = personRecordType.Id;
        insert personAccount;
        
        Account businessAccount = new Account();
        businessAccount.Name = 'Test Account 2';
        businessAccount.RecordTypeId = businessRecordType.Id;
        insert businessAccount;
        
        telegenta__Call_Campaign_State__c callCampaignStateRecord = [Select Id, telegenta__Lead__c, telegenta__Call_Campaign__c, telegenta__Unsuccessful_calls__c, telegenta__Has_appointment__c, telegenta__Stop_Calling__c, telegenta__Last_Call_Time__c, telegenta__Next_Call_Time__c from telegenta__Call_Campaign_State__c LIMIT 1];
 		telegenta__Campaign__c campaignRecord = [Select Id, Name from telegenta__Campaign__c LIMIT 1];
        telegenta__Outcome__c outcomeRecord = [Select Id, Name from telegenta__Outcome__c LIMIT 1];
        telegenta__Outcome_Field_Value__c fieldValueRecord = [Select Id, telegenta__Outcome_Name__c, telegenta__Field_Name__c, telegenta__Field_Value__c, telegenta__Question__c from telegenta__Outcome_Field_Value__c LIMIT 1];
        
        TelegentaOutcomeHelper.InvocableAttributes personAccountWrapper = new TelegentaOutcomeHelper.InvocableAttributes();
        personAccountWrapper.recordId = personAccount.Id;
        personAccountWrapper.objectName = 'Account';
        personAccountWrapper.campaignStateRecord = callCampaignStateRecord;
        personAccountWrapper.campaignRecord = campaignRecord;
        personAccountWrapper.outcomeRecord = outcomeRecord;
        personAccountWrapper.fieldValueRecord = new List<telegenta__Outcome_Field_Value__c>{fieldValueRecord};
            
        TelegentaOutcomeHelper.InvocableAttributes businessAccountWrapper = new TelegentaOutcomeHelper.InvocableAttributes();
        businessAccountWrapper.recordId = businessAccount.Id;
        businessAccountWrapper.objectName = 'Account';
        businessAccountWrapper.campaignStateRecord = callCampaignStateRecord;
        businessAccountWrapper.campaignRecord = campaignRecord;
        businessAccountWrapper.outcomeRecord = outcomeRecord;
        businessAccountWrapper.fieldValueRecord = new List<telegenta__Outcome_Field_Value__c>{fieldValueRecord};
        
        Test.startTest();
        TelegentaOutcomeHelper.updateRecord(new List<TelegentaOutcomeHelper.InvocableAttributes>{businessAccountWrapper});
        TelegentaOutcomeHelper.updateRecord(new List<TelegentaOutcomeHelper.InvocableAttributes>{personAccountWrapper});
        Test.stopTest();
    }
    
    @isTest
    public static void updateRecord_Test(){
        Lead leadRecord = [Select Id, Name from Lead LIMIT 1];
        telegenta__Call_Campaign_State__c callCampaignStateRecord = [Select Id, telegenta__Lead__c, telegenta__Call_Campaign__c, telegenta__Unsuccessful_calls__c, telegenta__Has_appointment__c, telegenta__Stop_Calling__c, telegenta__Last_Call_Time__c, telegenta__Next_Call_Time__c from telegenta__Call_Campaign_State__c LIMIT 1];
 		telegenta__Campaign__c campaignRecord = [Select Id, Name from telegenta__Campaign__c LIMIT 1];
        telegenta__Outcome__c outcomeRecord = [Select Id, Name from telegenta__Outcome__c LIMIT 1];
        telegenta__Outcome_Field_Value__c fieldValueRecord = [Select Id, telegenta__Outcome_Name__c, telegenta__Field_Name__c, telegenta__Field_Value__c, telegenta__Question__c from telegenta__Outcome_Field_Value__c LIMIT 1];
        TelegentaOutcomeHelper.InvocableAttributes wrapper = new TelegentaOutcomeHelper.InvocableAttributes();
        wrapper.recordId = leadRecord.Id;
        wrapper.objectName = 'Lead';
        wrapper.campaignStateRecord = callCampaignStateRecord;
        wrapper.campaignRecord = campaignRecord;
        wrapper.outcomeRecord = outcomeRecord;
        wrapper.fieldValueRecord = new List<telegenta__Outcome_Field_Value__c>{fieldValueRecord};
        Test.startTest();
        TelegentaOutcomeHelper.updateRecord(new List<TelegentaOutcomeHelper.InvocableAttributes>{wrapper});
        Test.stopTest();
    }
}