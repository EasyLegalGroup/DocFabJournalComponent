@isTest
public class DFJ_EventHandler_Test {
    @isTest public static void UpdateEventSubject_Test(){
        
        Lead leadIns = new Lead();
        leadIns.Company='test';
        leadIns.LastName='test';
        leadIns.Status='Open';
        leadIns.Phone='+4512345678';
        leadIns.Rating = 'Warm';
        leadIns.Provider_id__c = 'teatsest';
        insert leadIns;
        
        Event eventInstance = new Event();
        eventInstance.Type = 'Callback';
        eventInstance.Subject = 'Call with '+leadIns.LastName;
        eventInstance.WhoId = leadIns.Id;
        eventInstance.telegenta__Process_Time__c = null;
        eventInstance.StartDateTime = Datetime.now().addMinutes(-7);
        eventInstance.DurationInMinutes = 10;
        Test.startTest();
        insert eventInstance;
        Test.stopTest(); 
        
        Event eventIns = [SELECT Subject FROM Event LIMIT 1];
        Lead leadIns2 = [SELECT Rating FROM Lead LIMIT 1];
        System.assert(eventIns.Subject.contains(leadIns2.Rating));
    }
    
    @isTest
    public static void AddErrorLogs_Apex(){
        Test.startTest();
          DFJ_EventHandler.AddErrorLogs_Apex('Test record','Test Event','Test Message','severnity','source','lineNumber');        
        Test.stopTest();
    }
}