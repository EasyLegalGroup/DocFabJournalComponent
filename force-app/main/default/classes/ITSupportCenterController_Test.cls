@IsTest
private class ITSupportCenterController_Test {
    /*
* Simple HttpCalloutMock to stub Slack HTTP interactions.
*/
    // @isTest  
    private class DummySlackCalloutMock implements HttpCalloutMock {
        private String userId;
        
        public DummySlackCalloutMock(String userId) {
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
    static void dataSetup() {
        RecordType rt=[SELECT Id FROM RecordType WHERE Name = 'IT department' AND SObjectType = 'Case'];
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
        Case slackCaseUser1 = new Case();
        System.RunAs(supportUser){
            slackCaseUser1.Subject = 'Test CaseUser1';
            slackCaseUser1.Status = 'New';
            slackCaseUser1.Notification_Preferences__c = 'Slack';
            slackCaseUser1.RecordTypeId=rt.Id;
            insert slackCaseUser1;   
        }
        User u=[SELECT Id,Email FROM User WHERE Id=:UserInfo.getUserId()];
        
        
        
        
        System.runAs(u) {
            // Create test Case
            Case slackCase = new Case(
                Subject = 'Test Case',
                Status = 'New',
                CreatedById = u.Id,
                Notification_Preferences__c = 'Slack',
                RecordTypeId=rt.Id
            );
            insert slackCase;   
            FeedItem post = new FeedItem(
                ParentId = slackCase.Id,
                Body = 'This is a test post.',
                Type = 'TextPost',
                Visibility = 'AllUsers'
            );
            insert post; 
             // Step 3: Create ContentVersion (the file)
        ContentVersion contentVersion = new ContentVersion(
            Title = 'Test File',
            PathOnClient = 'testfile.txt',
            VersionData = Blob.valueOf('Sample file content')
        );
        insert contentVersion;

        // Step 4: Query ContentDocumentId
        Id contentDocumentId = [
            SELECT ContentDocumentId 
            FROM ContentVersion 
            WHERE Id = :contentVersion.Id
        ].ContentDocumentId;

        ContentDocumentLink cdl = new ContentDocumentLink(
            ContentDocumentId = contentDocumentId,
            LinkedEntityId = slackCase.Id, 
            ShareType = 'V',
            Visibility = 'AllUsers'
        );
        insert cdl;
            Case emailCase = new Case(Subject='IT Quick', Origin='Web', Status='New',Notification_Preferences__c = 'Email');
            insert emailCase;
            Case noPreferenceCase = new Case(Subject='IT Quick', Origin='Web', Status='New');
            insert noPreferenceCase;
            Case salesforceCase = new Case(Subject = 'Coverage Case', Origin = 'Web', Status = 'New',Notification_Preferences__c = 'Salesforce');
            insert salesforceCase;
            CaseComment cc = new CaseComment(ParentId = salesforceCase.Id, CommentBody = 'Seed comment', IsPublished = true);
            insert cc;
            FeedItem fi = new FeedItem(ParentId=emailCase.Id,Body='testing', IsRichText=true);
            insert fi;         
            Case c2 = new Case(Subject = 'Coverage Case2', Origin = 'Web', Status = 'Closed',Notification_Preferences__c = 'Salesforce');
            insert c2; 
            Case c3 = new Case(Subject = 'Coverage Case3', Origin = 'Web', Status = 'Awaiting Reply',Notification_Preferences__c = 'Salesforce');
            insert c3;
            
        }
        
        Knowledge__kav article = new Knowledge__kav(
            Title = 'Reset your password easily article',
            Summary = 'This article helps users reset passwords. article',
            Answer__c = 'To reset your article password, go to Settings > Password',
            UrlName = 'reset-article-password-' + System.currentTimeMillis(),
            Language = 'en_US'
        );
        insert article;  
        
    }
    
    @IsTest
    static void getUserInfo_Test() {
        Test.startTest();
        User getUser = ITSupportCenterController.getUserInfo();
        Test.stopTest();
        System.assertNotEquals(null,getUser);
    }
    
    @IsTest
    static void getITSupportRecordTypeId_Test() {
        Test.startTest();
        Id testRecordTypeId = ITSupportCenterController.getITSupportRecordTypeId();
        Test.stopTest();
        System.assertNotEquals(null,testRecordTypeId);
    }
    
    @IsTest
    static void getCases_Test() {
        Test.startTest();
        List<Case> getAllCase =  ITSupportCenterController.getCases();
        Test.stopTest();
        System.assertNotEquals(null,getAllCase);
    }
    
    @IsTest
    static void getCaseComments_Test() {
        Case c=[SELECT Id FROM Case WHERE Notification_Preferences__c = 'Email' LIMIT 1];
        Test.startTest();
        List<CaseComment> getCaseComments = ITSupportCenterController.getCaseComments(c.Id);
        Test.stopTest();
        System.assertNotEquals(null,getCaseComments);
    }
    
    @IsTest
    static void createCaseComment_Email_Test() {
        User u2=[SELECT Id FROM User WHERE Username='itsupport@test.com.test' AND isActive=true LIMIT 1];
        Case c=[SELECT Id FROM Case WHERE Notification_Preferences__c = 'Email' LIMIT 1];
        Test.startTest();
        System.RunAs(u2){
            ITSupportCenterController.createCaseComment(c.Id,'Test comment body');
            Test.stopTest();
        }
    }
    @IsTest
    static void createCaseComment_Slack_Test() {
        User u2=[SELECT Id FROM User WHERE Username='itsupport@test.com.test' AND isActive=true LIMIT 1];
        Test.setMock(HttpCalloutMock.class, new DummySlackCalloutMock(u2.Id));
        Case c=[SELECT Id FROM Case WHERE Subject = 'Test Case' LIMIT 1];
        Test.startTest();
        System.RunAs(u2){
            ITSupportCenterController.createCaseComment(c.Id,'Test comment body');
            Test.stopTest();
        }
    }
    @IsTest
    static void createCaseComment_Test3() {
        User u2=[SELECT Id FROM User WHERE Username='itsupport@test.com.test' AND isActive=true LIMIT 1];
        Case c=[SELECT Id FROM Case WHERE Notification_Preferences__c = 'Salesforce' LIMIT 1];
        Test.startTest();
        System.RunAs(u2){
            ITSupportCenterController.createCaseComment(c.Id,'Test comment body');
            Test.stopTest();
        }
    }
    @IsTest
    static void getLastUsedNotificationPreferences_Test() {
        Test.startTest();
        List<String> getData = ITSupportCenterController.getLastUsedNotificationPreferences();
        Test.stopTest();
        System.assertNotEquals(null,getData);
    }
    @IsTest
    static void sendNotifications_Test() {
        User u2=[SELECT Id FROM User WHERE Username='itsupport@test.com.test' AND isActive=true LIMIT 1];
        Test.setMock(HttpCalloutMock.class, new DummySlackCalloutMock(u2.Id));
        List<Case> insertedCases=[SELECT Id,CreatedById,Notification_Preferences__c FROM Case WHERE Notification_Preferences__c IN ('Slack') LIMIT 1];
        Test.startTest();
        ITSupportCenterController.NotificationRequest request = new ITSupportCenterController.NotificationRequest();
        request.caseId = insertedCases[0].Id;
        request.notificationTypes = insertedCases[0].Notification_Preferences__c.split(';');
        ITSupportCenterController.sendNotifications(request);
        Test.stopTest();
    }
    @IsTest
    static void sendNotifications_Email_Test() {
        User u2=[SELECT Id FROM User WHERE Username='itsupport@test.com.test' AND isActive=true LIMIT 1];
        Test.setMock(HttpCalloutMock.class, new DummySlackCalloutMock(u2.Id));
        List<Case> insertedCases=[SELECT Id,CreatedById,Notification_Preferences__c FROM Case WHERE Notification_Preferences__c ='Email' LIMIT 1];
        Test.startTest();
        ITSupportCenterController.NotificationRequest request = new ITSupportCenterController.NotificationRequest();
        request.caseId = insertedCases[0].Id;
        request.notificationTypes = insertedCases[0].Notification_Preferences__c.split(';');
        ITSupportCenterController.sendNotifications(request);
        Test.stopTest();
    }
    @IsTest
    static void sendNotifications_Salesforce_Test() {
        User u2=[SELECT Id FROM User WHERE Username='itsupport@test.com.test' AND isActive=true LIMIT 1];
        Test.setMock(HttpCalloutMock.class, new DummySlackCalloutMock(u2.Id));
        List<Case> insertedCases=[SELECT Id,CreatedById,Notification_Preferences__c FROM Case WHERE Notification_Preferences__c ='Salesforce' LIMIT 1];
        Test.startTest();
        ITSupportCenterController.NotificationRequest request = new ITSupportCenterController.NotificationRequest();
        request.caseId = insertedCases[0].Id;
        request.notificationTypes = insertedCases[0].Notification_Preferences__c.split(';');
        ITSupportCenterController.sendNotifications(request);
        Test.stopTest();
    }
    
    @isTest
    static void searchKnowledgeArticles_Test() {
        Test.startTest();
        Knowledge__kav article = new Knowledge__kav(
            Title = 'Reset your password easily article',
            Summary = 'This article helps users reset passwords. article',
            Answer__c = 'To reset your article password, go to Settings > Password',
            UrlName = 'reset-article-password-' + System.currentTimeMillis(),
            Language = 'en_US'
        );
        insert article; 
        Knowledge__kav objKav2 = [SELECT Id,Title,KnowledgeArticleId FROM Knowledge__kav WHERE Id =: article.Id];
        KbManagement.PublishingService.publishArticle(objKav2.KnowledgeArticleId, true);
        Id [] fixedSearchResults= new Id[1];
        fixedSearchResults[0] = article.Id;
        Test.setFixedSearchResults(fixedSearchResults);
        List<ITSupportCenterController.KnowledgeSearchResult> results = ITSupportCenterController.searchKnowledgeArticles('article', 5);
        Test.stopTest();
        System.assertNotEquals(null,results);
    }
    @isTest
    static void getKnowledgeArticleDetail_Test() {
        Test.startTest();
        Knowledge__kav article = new Knowledge__kav(
            Title = 'Reset your password easily article',
            Summary = 'This article helps users reset passwords. article',
            Answer__c = 'To reset your article password, go to Settings > Password',
            UrlName = 'reset-article-password-' + System.currentTimeMillis(),
            Language = 'en_US'
        );
        insert article; 
        Knowledge__kav objKav2 = [SELECT Id,Title,KnowledgeArticleId FROM Knowledge__kav WHERE Id =: article.Id];
        KbManagement.PublishingService.publishArticle(objKav2.KnowledgeArticleId, true);
        Id [] fixedSearchResults= new Id[1];
        fixedSearchResults[0] = article.Id;
        Test.setFixedSearchResults(fixedSearchResults);
        ITSupportCenterController.KnowledgeArticleDetail detail = ITSupportCenterController.getKnowledgeArticleDetail(article.Id);
        Test.stopTest();
        System.assertNotEquals(null,detail);
    }
    @IsTest
    static void markCaseAsSolved_Test() {
        User u=[SELECT Id,Email FROM User WHERE Id=:UserInfo.getUserId()];
        Test.setMock(HttpCalloutMock.class, new DummySlackCalloutMock(u.Id));
        Case slackCase =[SELECT Id FROM Case WHERE  Subject = 'Test Case' LIMIT 1 ];
        Case emaiCase =[SELECT Id FROM Case WHERE  Subject = 'IT Quick' LIMIT 1 ];
        Case salesforceCase =[SELECT Id FROM Case WHERE  Subject = 'Coverage Case' LIMIT 1 ];
        Test.startTest();
        System.RunAs(u){
            ITSupportCenterController.markCaseAsSolved(slackCase.Id);
            ITSupportCenterController.markCaseAsSolved(emaiCase.Id);
            ITSupportCenterController.markCaseAsSolved(salesforceCase.Id);
            Test.stopTest();
        }
    }
    @IsTest
    static void sendSupportResponse_Email_Test() {
        Case emailCase = [SELECT Id FROM Case WHERE  Notification_Preferences__c = 'Email' LIMIT 1];
        Test.startTest();
        ITSupportCenterController.sendSupportResponse(emailCase.Id, 'Some response', null);
        Test.stopTest();
    }
    @IsTest
    static void sendSupportResponse_Slack_Test() {
        User u=[SELECT Id,Email FROM User WHERE Id=:UserInfo.getUserId()];
        Test.setMock(HttpCalloutMock.class, new DummySlackCalloutMock(u.Id));
        Case slackCase =[SELECT Id FROM Case WHERE  Notification_Preferences__c = 'Slack' LIMIT 1 ];
        Test.startTest();
        ITSupportCenterController.sendSupportResponse(slackCase.Id, 'Testing Slack notification response message.', null);
        Test.stopTest();
    }
     @IsTest
    static void sendSupportResponse_Salesforce_Test() {
        User u=[SELECT Id,Email FROM User WHERE Id=:UserInfo.getUserId()];
        Test.setMock(HttpCalloutMock.class, new DummySlackCalloutMock(u.Id));
        Case salesforceCase =[SELECT Id FROM Case WHERE  Notification_Preferences__c = 'Salesforce' LIMIT 1 ];
        Test.startTest();
        ITSupportCenterController.sendSupportResponse(salesforceCase.Id, 'Testing Slack notification response message.', null);
        Test.stopTest();
    }
     @IsTest
    static void sendSupportResponse_ForElseCase_Test() {
        User u=[SELECT Id,Email FROM User WHERE Id=:UserInfo.getUserId()];
        Case salesforceCase =[SELECT Id FROM Case WHERE  Notification_Preferences__c = null LIMIT 1 ];
        Test.startTest();
        System.runAs(u){
        ITSupportCenterController.sendSupportResponse(salesforceCase.Id, 'Testing Slack notification response message.', null);
        }
        Test.stopTest();
    }
    @IsTest
    static void testSlackIntegration_Test() {
        User u=[SELECT Id,Email FROM User WHERE Id=:UserInfo.getUserId()];
        Test.setMock(HttpCalloutMock.class, new DummySlackCalloutMock(u.Id));
        Test.startTest();
        String getData = ITSupportCenterController.testSlackIntegration(u.Email);
        ITSupportCenterController.verifySlackRecipient('itsupport@test.com');
        Test.stopTest();
        System.assertNotEquals(null,getData);
    }
    @IsTest
    static void createChatterPost_Test() {
        User u=[SELECT Id,Email FROM User WHERE Id=:UserInfo.getUserId()];
        //  Test.setMock(HttpCalloutMock.class, new DummySlackCalloutMock(u.Id));
        User supportUser=[SELECT Id,Email FROM User WHERE Email='itsupport@test.com'];
        Case slackCase =[SELECT Id FROM Case WHERE  Subject = 'Test CaseUser1' LIMIT 1 ];
        Test.startTest();
        System.runAs(u){
            Test.setMock(HttpCalloutMock.class, new DummySlackCalloutMock(u.Id));
            ITSupportCenterController.createChatterPost(slackCase.Id, 'Rich **text** body');   
        }
        Test.stopTest();
    }
    @IsTest
    static void getChatterFeed_Test() {
        User u=[SELECT Id,Email FROM User WHERE Id=:UserInfo.getUserId()];
        List<Case> insertedCases=[SELECT Id,CreatedById,Notification_Preferences__c FROM Case where Subject = 'IT Quick' LIMIT 1];
        Test.startTest();
        System.runAs(u){
            Test.setMock(HttpCalloutMock.class, new DummySlackCalloutMock(u.Id));
            List<ITSupportCenterController.ChatterFeedWrapper> feed = ITSupportCenterController.getChatterFeed(insertedCases[0].Id);   
            Test.stopTest();
        }
    }
    @IsTest
    static void processRichTextForCaseDescription_Test() {
        Test.startTest();
        String plain = ITSupportCenterController.processRichTextForCaseDescription('<p>Hello</p>');  
        Test.stopTest();
        System.AssertNotEquals(null,plain);
        
    }
    @IsTest
    static void createChatterPostWithFiles_Test() {
        User u=[SELECT Id,Email FROM User WHERE Id=:UserInfo.getUserId()];
        User supportUser=[SELECT Id,Email FROM User WHERE Email='itsupport@test.com'];
        List<Case> insertedCases=[SELECT Id,CreatedById,Notification_Preferences__c FROM Case where Subject = 'Test Case' LIMIT 1];
        Test.startTest();
        System.runAs(supportUser){
            Test.setMock(HttpCalloutMock.class, new DummySlackCalloutMock(supportUser.Id));
            ITSupportCenterController.createChatterPostWithFiles(insertedCases[0].Id, 'Body', new List<String>());  
            Test.stopTest();
        }
        
    }
     @IsTest
    static void createChatterPostWithFiles_Salesforce_Test() {
        User u=[SELECT Id,Email FROM User WHERE Id=:UserInfo.getUserId()];
        User supportUser=[SELECT Id,Email FROM User WHERE Email='itsupport@test.com'];
        List<Case> insertedCases=[SELECT Id,CreatedById,Notification_Preferences__c FROM Case where Subject = 'Coverage Case' LIMIT 1];
        Test.startTest();
        System.runAs(supportUser){
            Test.setMock(HttpCalloutMock.class, new DummySlackCalloutMock(supportUser.Id));
            ITSupportCenterController.createChatterPostWithFiles(insertedCases[0].Id, 'Body', new List<String>());  
            Test.stopTest();
        }
        
    }
     @IsTest
    static void createChatterPostWithFiles_Email_Test() {
        User u=[SELECT Id,Email FROM User WHERE Id=:UserInfo.getUserId()];
        User supportUser=[SELECT Id,Email FROM User WHERE Email='itsupport@test.com'];
        List<Case> insertedCases=[SELECT Id,CreatedById,Notification_Preferences__c FROM Case where Subject = 'IT Quick' LIMIT 1];
        Test.startTest();
        System.runAs(supportUser){
            Test.setMock(HttpCalloutMock.class, new DummySlackCalloutMock(supportUser.Id));
            ITSupportCenterController.createChatterPostWithFiles(insertedCases[0].Id, 'Body', new List<String>());  
            Test.stopTest();
        }
        
    }
    @IsTest
    static void getEnhancedChatterFeed_Test() {
        List<Case> insertedCases=[SELECT Id,CreatedById,Notification_Preferences__c FROM Case where Subject = 'Test Case' LIMIT 1];
        List<ITSupportCenterController.EnhancedFeedWrapper> getWrapperData = new List<ITSupportCenterController.EnhancedFeedWrapper>();
        Test.startTest();
        getWrapperData = ITSupportCenterController.getEnhancedChatterFeed(insertedCases[0].Id);  
        Test.stopTest();  
        System.AssertNotEquals(null,getWrapperData);
    }
    @IsTest
    static void createCaseWithChatMessage_Test() {
        RecordType rt=[SELECT Id FROM RecordType WHERE Name = 'IT department' AND SObjectType = 'Case'];
        Map<String, Object> caseData = new Map<String, Object>{
            'Subject' => 'Created via API',
            'Origin'  => 'Web',
            'Status'  => 'New',
            'Description' => 'New',
            'Notification_Preferences__c' => 'Email',
            'RecordTypeId' => rt.Id
        };
        List<Case> insertedCases=[SELECT Id,CreatedById,Notification_Preferences__c FROM Case where Subject = 'Test Case' LIMIT 1];
        Case cc=[SELECT Id FROM Case WHERE Subject = 'Coverage Case' LIMIT 1];
        Test.startTest();
        ITSupportCenterController.createCaseWithChatMessage(caseData, 'Initial message', null); 
        ITSupportCenterController.addCaseCommentViaChatMessage(insertedCases[0].Id, 'Chat body', null);
       	ITSupportCenterController.sendSupportResponseViaChatMessage(insertedCases[0].Id, 'Resp', null);
        ITSupportCenterController.getCaseChatMessages(insertedCases[0].Id);
        ITSupportCenterController.shouldUseChatIntegration();
        ITSupportCenterController.migrateCaseCommentsToChat(cc.Id);
        Test.stopTest();
        
    }
}