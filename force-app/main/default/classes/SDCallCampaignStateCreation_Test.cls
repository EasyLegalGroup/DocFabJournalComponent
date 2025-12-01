@isTest
public class SDCallCampaignStateCreation_Test {
    @testSetup static void setup(){
        
    }
    @isTest
    public static void UpsertCallCampaignStateForRecord_Apex_Test(){
        List<Lead> leadList = new List<Lead>();
        Lead leadIns = new Lead();
        leadIns.Company='test';
        leadIns.LastName='test';
        leadIns.Status='Open';
        leadIns.Phone='+4512345678';
        leadIns.Lead_Group_name__c = 'TD Kampagne 1';
        leadIns.telegenta__Next_Call_Time__c = DateTime.now().addHours(1);
        leadIns.telegenta__Last_Contact_State__c = 'Got Appointment';
        leadIns.telegenta__Unsuccessful_Calls__c = 2;
        leadIns.telegenta__Total_Calls__c = 2;
        leadIns.Provider_id__c = '1a1a1s12111';
        
        leadList.add(leadIns); 
        
        Lead lead2Ins = new Lead();
        lead2Ins.Company='test';
        lead2Ins.LastName='test';
        lead2Ins.Status='Open';
        lead2Ins.Phone='+4512345679';
        lead2Ins.Lead_Group_name__c = 'TD Kampagne 1';
        lead2Ins.telegenta__Next_Call_Time__c = DateTime.now().addHours(1);
        lead2Ins.telegenta__Last_Contact_State__c = 'Got Appointment';
        lead2Ins.telegenta__Unsuccessful_Calls__c = 3;
        lead2Ins.telegenta__Total_Calls__c = 3;
        lead2Ins.Provider_id__c = '1a1a1s1212211';
        leadList.add(lead2Ins); 
        insert leadList; 
        
        telegenta__Outcome__c outcomeToInsert = new telegenta__Outcome__c();
        outcomeToInsert.Name = 'Appointment';
        //outcomeToInsert.telegenta__Call_Outcome_Profile__c = outcomeProfileInstance.Id;
        insert outcomeToInsert;
        
        telegenta__Campaign__c campaignInstance = new telegenta__Campaign__c();
        campaignInstance.Name = 'Test';     
        insert campaignInstance;
        
        telegenta__Lead_group__c leadGroupInstance = new telegenta__Lead_group__c();
        leadGroupInstance.Name = 'TDK - Kampagne 1';
        leadGroupInstance.telegenta__Object_Name__c = 'Lead';
        leadGroupInstance.telegenta__Filter__c = 'Test demo';
        leadGroupInstance.telegenta__Description__c = 'Test description';
        leadGroupInstance.telegenta__Filter_Query__c = 'IsConverted = false';
        leadGroupInstance.telegenta__Priority_String__c = 'telegenta__Priority__c DESC;Latitude DESC;NumberOfEmployees DESC;AnnualRevenue DESC;';
        leadGroupInstance.telegenta__Timeout_Duration__c = 10;
        leadGroupInstance.telegenta__No_Answer_Timeout_Duration__c = 10;
        leadGroupInstance.telegenta__Auto_Dial_Mode__c = true;
        leadGroupInstance.telegenta__Phone_number_Id__c = '456';
        leadGroupInstance.telegenta__Reassign_No_Answer_Owner__c = UserInfo.getUserId();
        leadGroupInstance.telegenta__Call_Campaign__c = campaignInstance.Id;
        
        insert leadGroupInstance;
        
        List<telegenta__Call_Campaign_State__c> callCampaignStateList = new List<telegenta__Call_Campaign_State__c>();
        telegenta__Call_Campaign_State__c callCampaignStateInstance = new telegenta__Call_Campaign_State__c();
        callCampaignStateInstance.telegenta__Lead__c = leadIns.Id;
        callCampaignStateInstance.telegenta__Next_Call_Time__c = DateTime.now().addHours(2);
        callCampaignStateInstance.telegenta__Call_Campaign__c = campaignInstance.Id;
        callCampaignStateList.add(callCampaignStateInstance);
        
        telegenta__Call_Campaign_State__c callCampaignState2Instance = new telegenta__Call_Campaign_State__c();
        callCampaignState2Instance.telegenta__Lead__c = leadIns.Id;
        callCampaignState2Instance.telegenta__Call_Campaign__c = campaignInstance.Id;
        callCampaignStateList.add(callCampaignState2Instance);
        insert callCampaignStateList; 
        Test.startTest();
        SDCallCampaignStateCreation.UpsertCallCampaignStateForRecord_Apex();
        Test.stopTest();
        
        List<telegenta__Call_Campaign_State__c> callCampaignStateTestList = new List<telegenta__Call_Campaign_State__c>();
        callCampaignStateTestList = [SELECT Id,Name,telegenta__Next_Call_Time__c,telegenta__Call_Campaign__c FROM telegenta__Call_Campaign_State__c WHERE Name = 'TestInsert' LIMIT 1];
    }
}