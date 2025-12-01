@IsTest
private class ChatServiceQuickTest {

    // Simple mock to avoid real Slack HTTP call
    private class SlackMock implements HttpCalloutMock {
         private String userId;

    public SlackMock(String userId) {
        this.userId = userId;
    }
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            String body = '{"ok": true, "user":{"id": "' + userId + '", "email": "itsupport@test.com"} , "channel":{"id": "' + userId + '", "email": "itsupport@test.com"}}';
               res.setBody(body);
            res.setStatusCode(200);
            return res;
        }
    }
    
    
    @TestSetup
    static void dataSetup(){
      RecordType rt=[SELECT Id FROM RecordType WHERE Name = 'IT department' AND SObjectType = 'Case'];
      Case c = new Case(Subject='Notification Test', Origin='Web', Status='New', Notification_Preferences__c = 'Email', Description = 'Test case description');
      insert c;
      Case ca = new Case(Subject='Notification Test', Origin='Web', Status='New', Notification_Preferences__c = 'Slack', Description = 'Test case description', RecordTypeId=rt.Id);
      insert ca;
    }

    @isTest static void coverChatService() {
        //Added By Kajal Start
    //    User u=[SELECT Id,Email FROM User WHERE isActive=true LIMIT 1];
                //Added By Kajal End
         Profile p = [SELECT Id FROM Profile WHERE Name = 'System Administrator' LIMIT 1];
        User supportUser = new User(
            FirstName = 'IT', LastName = 'Support',
            Alias = 'itsup', Email = 'itsupport@test.com',
            Username = 'itsupport@test.com.test', ProfileId = p.Id,
            TimeZoneSidKey = 'Asia/Kolkata', LocaleSidKey = 'en_US',
            EmailEncodingKey = 'UTF-8', LanguageLocaleKey = 'en_US',
            IsActive = true,
            Company__c = 'Din Familiejurist ApS'
        );
        insert supportUser;
         Case c=[SELECT Id FROM Case WHERE Notification_Preferences__c='Email'];
         Case ca=[SELECT Id FROM Case WHERE Notification_Preferences__c='Slack'];
        List<Map<String,Object>> files = new List<Map<String,Object>>{
            new Map<String,Object>{
                'name'=>'dummy.txt',
                'base64Data'=>EncodingUtil.base64Encode(Blob.valueOf('dummy')),
                'size'=>5,
                'type'=>'text/plain'
            }
        };

        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new SlackMock(supportUser.Id));
        Object res1 = ChatService.createMessage('<p>Hello</p>', c.Id, null);
        System.assertNotEquals(null, res1);
        Object res2 = ChatService.createMessage('<p>With file</p>', c.Id, files);
        System.assertNotEquals(null, res2);
        ChatService.sendMessageAndUpdateStatus('<p>update</p>', c.Id, null, 'Waiting for Reply');
        ChatService.sendMessageAndCloseCase('<p>close</p>', c.Id, null);
        List<Object> history = (List<Object>) ChatService.getConversationHistory(c.Id);
        ChatService.sendCaseCreationNotification(ca.Id);
            String testResult = ChatService.testNotificationSystem('test@example.com');
            System.assertNotEquals(null, testResult);
        Test.stopTest();
        System.assert(history.size() > 0);
    }
    
    
}