@isTest
public class TestGettingNextLead {

    @isTest
    private static void nextLeadFromSession_Test(){

        Lead leadIns = new Lead();
        leadIns.Company='test';
        leadIns.LastName='test';
        leadIns.Status='Open';
        leadIns.Phone='+4512345678';
        leadIns.telegenta__Last_Contact_State__c='Got appointment';
        leadIns.telegenta__Next_Call_Time__c=Datetime.now().addHours(-1);
        leadIns.Provider_id__c = '1q2we4ee';
        leadIns.OwnerId = UserInfo.getUserId();
        insert leadIns;
        
        
        Database.LeadConvert lc = new Database.LeadConvert();
        lc.setLeadId(leadIns.id);

        LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true AND MasterLabel = 'Qualified' LIMIT 1];
        lc.setConvertedStatus(convertStatus.MasterLabel);
        Database.LeadConvertResult lcr = Database.convertLead(lc);
        System.assert(lcr.isSuccess());
        
        Event eventInstance = new Event();
        eventInstance.Type = 'Callback';
        eventInstance.WhoId = leadIns.Id;
        eventInstance.Subject = 'Test Event';
        eventInstance.telegenta__Process_Time__c = null;
        eventInstance.StartDateTime = Datetime.now().addMinutes(-7);
        eventInstance.DurationInMinutes = 10;
        insert eventInstance;
        
        

        telegenta__Lead_group__c leadGroupInstance = new telegenta__Lead_group__c();
        leadGroupInstance.Name = 'Test Name';
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
        insert leadGroupInstance;

        telegenta__Dialer_Session__c dialerSessionInstance = new telegenta__Dialer_Session__c();
        dialerSessionInstance.Name = 'Test Dialer Session';
        dialerSessionInstance.telegenta__Start_Time__c = Datetime.now();
        dialerSessionInstance.telegenta__Status__c = 'Active';
        dialerSessionInstance.telegenta__Lead_group__c = leadGroupInstance.Id;
        dialerSessionInstance.telegenta__Filter_Query__c = 'IsConverted = false';
        insert dialerSessionInstance;
        
        
        
        telegenta__Lead_group__c leadGroupInstanceForConvertedLead = new telegenta__Lead_group__c();
        leadGroupInstanceForConvertedLead.Name = 'Test Name';
        leadGroupInstanceForConvertedLead.telegenta__Object_Name__c = 'Lead';
        leadGroupInstanceForConvertedLead.telegenta__Filter__c = 'Test demo';
        leadGroupInstanceForConvertedLead.telegenta__Description__c = 'Test description';
        leadGroupInstanceForConvertedLead.telegenta__Filter_Query__c = 'IsConverted = true';
        leadGroupInstanceForConvertedLead.telegenta__Priority_String__c = 'telegenta__Priority__c DESC;Latitude DESC;NumberOfEmployees DESC;AnnualRevenue DESC;';
        leadGroupInstanceForConvertedLead.telegenta__Timeout_Duration__c = 10;
        leadGroupInstanceForConvertedLead.telegenta__No_Answer_Timeout_Duration__c = 10;
        leadGroupInstanceForConvertedLead.telegenta__Auto_Dial_Mode__c = true;
        leadGroupInstanceForConvertedLead.telegenta__Phone_number_Id__c = '456';
        leadGroupInstanceForConvertedLead.telegenta__Reassign_No_Answer_Owner__c = UserInfo.getUserId();
        insert leadGroupInstanceForConvertedLead;

        telegenta__Dialer_Session__c dialerSessionInstanceForConvertedLead = new telegenta__Dialer_Session__c();
        dialerSessionInstanceForConvertedLead.Name = 'Test Dialer Session';
        dialerSessionInstanceForConvertedLead.telegenta__Start_Time__c = Datetime.now();
        dialerSessionInstanceForConvertedLead.telegenta__Status__c = 'Active';
        dialerSessionInstanceForConvertedLead.telegenta__Lead_group__c = leadGroupInstance.Id;
        dialerSessionInstanceForConvertedLead.telegenta__Filter_Query__c = 'IsConverted = false';
        insert dialerSessionInstanceForConvertedLead;
        
        
        
        Test.startTest();
        GettingNextLead.nextLeadFromSession_Apex(String.valueOf(dialerSessionInstance.Id));
        GettingNextLead.nextLeadFromSession_Apex(null);
        GettingNextLead.nextLeadFromSession_Apex(String.valueOf(dialerSessionInstanceForConvertedLead.Id));
        Test.stopTest();
    }
}