@isTest
public class DFJ_UpdateCallHistoryMarketUnit_Test {
    
    @isTest
    public static void setMarketUnit_Apex_Test(){
        
        Profile pf = [Select Id from profile where Name = 'System Administrator'];

        String orgId = UserInfo.getOrganizationId();
        String dateString = String.valueof(Datetime.now()).replace(' ', '').replace(':', '').replace('-', '');
        Integer RandomId = Integer.valueOf(Math.rint(Math.random() * 1000000));
        String uniqueName = orgId + dateString + RandomId;

        User uu = new User(firstname = 'ABC',
                lastName = 'XYZ',
                email = uniqueName + '@test' + orgId + '.org',
                Username = uniqueName + '@test' + orgId + '.org',
                EmailEncodingKey = 'ISO-8859-1',
                Alias = uniqueName.substring(18, 23),
                TimeZoneSidKey = 'America/Los_Angeles',
                LocaleSidKey = 'en_US',
                LanguageLocaleKey = 'en_US',
                ProfileId = pf.Id,
                Market_Unit__c = 'FA_SE',
                Company__c = 'Din Familiejurist ApS'
                /*UserRoleId = obj.Id*/);
        insert uu;
        
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;
        
        List<telegenta__Telegenta_Call_History__c> callList = new List<telegenta__Telegenta_Call_History__c>();
        for(Integer i=0;i<10;i++){
          telegenta__Telegenta_Call_History__c callHistoryInstance = new telegenta__Telegenta_Call_History__c();
        callHistoryInstance.telegenta__Account__c = acc.Id;
        callHistoryInstance.telegenta__Call_Start_Time__c = Datetime.now();
        callHistoryInstance.telegenta__Call_End_Time__c = Datetime.now().addHours(2);
        callHistoryInstance.telegenta__Active_Duration__c = 10;
        callList.add(callHistoryInstance);  
        }
      
        
        Test.startTest();
        insert callList;
        //DFJ_UpdateCallHistoryMarketUnit_Apex.setMarketUnit_Apex(callList);
        DFJ_UpdateCallHistoryMarketUnit_Apex.setMarketUnit_Apex(null);
        Test.stopTest();
    }
}