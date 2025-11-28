@isTest
global class DocfabricatorRecordSync_Test {

    global class MockHttpResponseGenerator implements HttpCalloutMock {
        // Implement this interface method
        
        global HTTPResponse respond(HTTPRequest req) {
             system.debug('>> req.getMethod()');
            HttpResponse res = new HttpResponse();
                    system.debug('>> req.getMethod()'+req.getMethod());
            res.setHeader('Content-Type', 'application/json');
            if (req.getHeader('Authorization-Key') != 'aa11bb22cc33') {
                res.setBody('Unauthorized Access.');
                res.setStatusCode(401);
            } else if(String.isBlank(req.getEndpoint())){
                res.setBody('Server error.');
                res.setStatusCode(500);
            } else if(req.getMethod().equals('POST')){
                res.setBody('Upserted successfully.');
                res.setStatusCode(200);
            } else if (req.getMethod().equals('DELETE')) {
                res.setBody('Updated successfully.');
                res.setStatusCode(200);
            } else if (req.getMethod().equals('PUT')) {
                res.setBody('Upserted successfully.');
                res.setStatusCode(200);
            } else if (req.getMethod().equals('GET')) {
                res.setBody('Retrieved records.');
                res.setStatusCode(200);
            } else{
                res.setBody('Server error.');
                res.setStatusCode(500);
            }
            return res;
        }
    }

    //Chnages DIN-348
    //Start
    @isTest static void getSublistObjectList_Test(){
        String parentModalName = 'Account';
        Test.startTest();
        DF_RecordSync_Utility.getSublistObjectList(parentModalName);
        Test.stopTest();
    }
    //End
    @isTest static void notAuthorizedOnCreate_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        // List<Account> accountList = DFJ_TestDataFactory.createAccountWithContact(1, 1);
        Test.setMock(HttpCalloutMock.class, new DocfabricatorRecordSync_Test.MockHttpResponseGenerator());

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = '/services/apexrest/v1/recordSync/testuuid';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"Name":"Demo Account0","_record_model":"Account","Contact":[{"LastName":"DummyLastName0"}]}');
        request.addHeader('Authorization-Key', 'aa11bb22c');
        RestContext.request = request;
        RestContext.response = response;
        // Call the method to test
        Test.startTest();
        DocfabricatorRecordSync_Apex.CreateRecordSyncData();
        Test.stopTest();
        System.assertEquals(401, response.statusCode);
    }

    @isTest static void nullUrlOnCreate_Test() {
        // DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        // List<Account> accountList = DFJ_TestDataFactory.createAccountWithContact(1, 1);
        // Test.setMock(HttpCalloutMock.class, new DocfabricatorRecordSync_Test.MockHttpResponseGenerator());

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = null;
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"Name":"Demo Account0","_record_model":"Account","Contact":[{"LastName":"DummyLastName0"}]}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        // Call the method to test
        Test.startTest();
        DocfabricatorRecordSync_Apex.CreateRecordSyncData();
        Test.stopTest();
        System.assertEquals(500, response.statusCode);
    }

    @isTest static void createNewRecords_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        Test.setMock(HttpCalloutMock.class, new DocfabricatorRecordSync_Test.MockHttpResponseGenerator());

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = '/services/apexrest/v1/recordSync/testuuid';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"Name":"Demo Account","_record_model":"Account","Contact":[{"LastName":"DemoLastName","DoNotCall":["Yes"],"Description":"DemoLastName","Demo":"Demo","Primary Stripe Customer":"true"}]}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        // Call the method to test
        Test.startTest();
        DocfabricatorRecordSync_Apex.CreateRecordSyncData();
        Test.stopTest();
        System.assertEquals(200, response.statusCode);
    }

    @isTest static void invalidJson_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        Test.setMock(HttpCalloutMock.class, new DocfabricatorRecordSync_Test.MockHttpResponseGenerator());

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = '/services/apexrest/v1/recordSync/testuuid';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"Name":"Demo Account","');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        // Call the method to test
        Test.startTest();
        DocfabricatorRecordSync_Apex.CreateRecordSyncData();
        Test.stopTest();
        System.assertEquals(500, response.statusCode);
    }

    @isTest static void notAuthorizedOnUpdate_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        List<Account> accountList = DFJ_TestDataFactory.createAccountWithContact(1, 1);
        Test.setMock(HttpCalloutMock.class, new DocfabricatorRecordSync_Test.MockHttpResponseGenerator());

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = '/services/apexrest/v1/recordSync/testuuid';
        request.httpMethod = 'PUT';
        request.requestBody = Blob.valueOf('{"Name":"Demo Account0","_record_model":"Account","Contact":[{"LastName":"DummyLastName0"}]}');
        request.addHeader('Authorization-Key', 'aa11bb22c');
        RestContext.request = request;
        RestContext.response = response;
        // Call the method to test
        Test.startTest();
        DocfabricatorRecordSync_Apex.UpdateRecordSyncData();
        Test.stopTest();
        System.assertEquals(401, response.statusCode);
    }

    @isTest static void nullUrlOnUpdate_Test() {
        // DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        // List<Account> accountList = DFJ_TestDataFactory.createAccountWithContact(1, 1);
        // Test.setMock(HttpCalloutMock.class, new DocfabricatorRecordSync_Test.MockHttpResponseGenerator());

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = null;
        request.httpMethod = 'PUT';
        request.requestBody = Blob.valueOf('{"Name":"Demo Account0","_record_model":"Account","Contact":[{"LastName":"DummyLastName0"}]}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        // Call the method to test
        Test.startTest();
        DocfabricatorRecordSync_Apex.UpdateRecordSyncData();
        Test.stopTest();
        System.assertEquals(500, response.statusCode);
    }

    @isTest static void updateNewRecords_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        List<Account> accountList = DFJ_TestDataFactory.createAccountWithContact(1, 1);
        Test.setMock(HttpCalloutMock.class, new DocfabricatorRecordSync_Test.MockHttpResponseGenerator());

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = '/services/apexrest/v1/recordSync/testuuid';
        request.httpMethod = 'PUT';
        request.requestBody = Blob.valueOf('{"Name":"Demo Account0","_record_model":"Account","Contact":[{"LastName":"DummyLastName0"}]}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        // Call the method to test
        Test.startTest();
        DocfabricatorRecordSync_Apex.UpdateRecordSyncData();
        Test.stopTest();
        System.assertEquals(200, response.statusCode);
    }
    
    

    @isTest static void notAuthorizedOnDelete_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        List<Account> accountList = DFJ_TestDataFactory.createAccountWithContact(1, 1);
        Test.setMock(HttpCalloutMock.class, new DocfabricatorRecordSync_Test.MockHttpResponseGenerator());

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = '/services/apexrest/v1/recordSync/testuuid';
        request.httpMethod = 'DELETE';
        request.requestBody = Blob.valueOf('{"Name":"Demo Account0","_record_model":"Account","Contact":[{"LastName":"DummyLastName0"}]}');
        request.addHeader('Authorization-Key', 'aa11bb22c');
        RestContext.request = request;
        RestContext.response = response;
        // Call the method to test
        Test.startTest();
        DocfabricatorRecordSync_Apex.DeleteRecordSyncData();
        Test.stopTest();
        System.assertEquals(401, response.statusCode);
    }

    // @isTest static void deleteRecords_Test() {
    //     DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
    //     List<Account> accountList = DFJ_TestDataFactory.createAccountWithContact(1, 1);
    //     Test.setMock(HttpCalloutMock.class, new DocfabricatorRecordSync_Test.MockHttpResponseGenerator());

    //     RestRequest request = new RestRequest();
    //     RestResponse response = new RestResponse();

    //     request.requestURI = '/services/apexrest/v1/recordSync/testuuid';
    //     request.httpMethod = 'DELETE';
    //     request.requestBody = Blob.valueOf('{"_record_model":"Account"}');
    //     request.addHeader('Authorization-Key', 'aa11bb22cc33');
    //     RestContext.request = request;
    //     RestContext.response = response;
    //     // Call the method to test
    //     Test.startTest();
    //     DocfabricatorRecordSync_Apex.DeleteRecordSyncData();
    //     Test.stopTest();
    //     System.assertEquals(200, response.statusCode);
    // }

    @isTest static void nullUrlOnDelete_Test() {
        // DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        // List<Account> accountList = DFJ_TestDataFactory.createAccountWithContact(1, 1);
        Test.setMock(HttpCalloutMock.class, new DocfabricatorRecordSync_Test.MockHttpResponseGenerator());

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = null;
        request.httpMethod = 'DELETE';
        request.requestBody = Blob.valueOf('{"Name":"Demo Account0","_record_model":"Account","Contact":[{"LastName":"DummyLastName0"}]}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        // Call the method to test
        Test.startTest();
        DocfabricatorRecordSync_Apex.DeleteRecordSyncData();
        Test.stopTest();
        System.assertEquals(500, response.statusCode);
    }
    @isTest
    public static void addErrorLogsWithoutInsert_Test(){
        // List<telegenta__Phone_Group_User__c> phoneUsers = DFJ_TestDataFactory.createPhoneGroupUsers(1,true);
        Test.startTest();
        Log__c result = DF_RecordSync_Utility.addErrorLogsWithoutInsert('Test RecordId', 'Test Event', 'Test Message', 'Test Error', 'Test Souece', 'Test Stacttrace','Test Line number');
        Log__c result1 =DF_RecordSync_Utility.addErrorLogsWithoutInsert('Test RecordId', 'Test Event', 'Truncated text. When the driver determines that an Excel column contains text data, the driver selects the data type (string or memo) based on the longest value that it samples. If the driver does not discover any values longer than 255 characters in the rows that it samples, it treats the column as a 255-character string column instead of a memo column. Therefore, values longer than 255 characters may be truncated. To import data from a memo column without truncation, you must make sure that the memo column in at least one of the sampled rows contains a value longer than 255 characters', 'Test Error', 'Test Souece', 'Test Stacttrace','Test Line number');
        Test.stopTest();
        System.assertEquals('Test Event', result.Event__c);
        System.assertEquals('Test Event', result1.Event__c);
    }

    @isTest static void dmlHelperOnDelete_Test() {
        Test.setMock(HttpCalloutMock.class, new DocfabricatorRecordSync_Test.MockHttpResponseGenerator());
        // Call the method to test
        Test.startTest();
        DF_RecordSync_Utility.RestResponseWrapper res =  DF_RecordSync_Utility.dmlHelper(null, 'DELETE');
        DateTime parsedDateTime = DF_RecordSync_Utility.parseDateTimeString('Wed, 08 Jun 2022 00:00:00 GMT');
        Test.stopTest();
        System.assertEquals(500, res.statusCode);
        System.assertEquals(Datetime.newInstance(2022, 06, 08, 00, 00, 00), parsedDateTime);
       
    }

    @isTest static void getFieldDescriptionNegative_Test() {
        // Call the method to test
        Map<String,SObjectField> fMap = Schema.getGlobalDescribe().get('Account').getDescribe().Fields.getMap();
        System.debug('fMap-->'+fMap);
           
        Test.startTest();
        DF_RecordSync_Utility.RestResponseWrapper res =  DF_RecordSync_Utility.dmlHelper(null, 'DELETE');
        String result = DF_RecordSync_Utility.getFieldDescription(fMap,'Lead__c');
        Test.stopTest();
       // System.assertEquals(true, String.isBlank(result));
    }
    
    /*
        @isTest static void updateNewRecords_Test1() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        List<Account> accountList = DFJ_TestDataFactory.createAccountWithContact(1, 1);
            system.debug('>>accountList'+accountList);
        Test.setMock(HttpCalloutMock.class, new DocfabricatorRecordSync_Test.MockHttpResponseGenerator());

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

            
        request.requestURI = '/services/apexrest/v1/recordSync/testuuid';
        request.httpMethod = 'PUT';
            String currentUserId = UserInfo.getUserId();
        request.requestBody = Blob.valueOf('{"Name":"Demo Account0","owner_id":"'+currentUserId+'":"Account","Contact":[{"LastName":"DummyLastName0","AccountId":"'+accountList[0].Id+'"}]}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        // Call the method to test
        Test.startTest();
        DocfabricatorRecordSync_Apex.UpdateRecordSyncData();
        Test.stopTest();
        //System.assertEquals(200, response.statusCode);
    }
*/
     @isTest static void updateNewRecords_Test2() {
           DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        List<Account> accountList = DFJ_TestDataFactory.createAccountWithContact(1, 1);
            system.debug('>>accountList'+accountList);
        Test.setMock(HttpCalloutMock.class, new DocfabricatorRecordSync_Test.MockHttpResponseGenerator());

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

            
        request.requestURI = '/services/apexrest/v1/recordSync/testuuid';
        request.httpMethod = 'PUT';
        request.requestBody = Blob.valueOf('{"Name":"Demo Account0","_record_model":"Account","Contact":[{"LastName":"DummyLastName0","AccountId":"'+accountList[0].Id+'"}]}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        // Call the method to test
        Test.startTest();
        DocfabricatorRecordSync_Apex.UpdateRecordSyncData();
        Test.stopTest();
        System.assertEquals(200, response.statusCode);
            //   request.requestBody = Blob.valueOf('{"Account__c":"'+accountList[0].Id+'","_record_model":"df_journal_dk__c","Uuid__c": "Test"}');

    }
}