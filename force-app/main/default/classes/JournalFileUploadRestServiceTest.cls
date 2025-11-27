@isTest
public class JournalFileUploadRestServiceTest {
    @TestSetup
    static void setupData(){
        Journal__c journal = new Journal__c(Market_Unit__c='FA_SE',Type__c='Inheritance',External_record_uuid__c='TestExtRecId');
        insert journal;
    }

    @isTest
    static void testUploadFileToAccount_Success() {
        Journal__c journal = [SELECT Id, Name from Journal__c LIMIT 1];
        setRestServiceRequest('/services/apexrest/uploadFilesToJournal/'+journal.Name, 'POST', 'Sample file content', new Map<String, String>{'File-Name' => 'TestFile'});
        
        Test.startTest();
        JournalFileUploadRestService.uploadFileToAccount();
        Test.stopTest();
        
        System.assertEquals(200, RestContext.response.statusCode);
        System.assertEquals('File uploaded successfully', RestContext.response.responseBody.toString());
    }
    
    @isTest
    static void testUploadFileToAccount_InvalidJournal() {
        setRestServiceRequest('/services/apexrest/uploadFilesToJournal/InvalidJournal', 'POST', 'Sample file content', new Map<String, String>{'File-Name' => 'TestFile'});

        Test.startTest();
        JournalFileUploadRestService.uploadFileToAccount();
        Test.stopTest();
        
        System.assertEquals(400, RestContext.response.statusCode);
        System.assert(RestContext.response.responseBody.toString().contains('Invalid Journal Name'));
    }
    
    @isTest
    static void testUploadFileToAccount_MissingFileName() {
        Journal__c journal = [SELECT Id, Name from Journal__c LIMIT 1];
        setRestServiceRequest('/services/apexrest/uploadFilesToJournal/'+journal.Name, 'POST', 'Sample file content', null);
        
        Test.startTest();
        JournalFileUploadRestService.uploadFileToAccount();
        Test.stopTest();
        
        System.assertEquals(400, RestContext.response.statusCode);
        System.assert(RestContext.response.responseBody.toString().contains('Either file content or file name is missing'));
    }

    static void setRestServiceRequest(String endpoint, String method, String body, Map<String, String> headers){
        RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();
        req.requestUri = endpoint;
        req.httpMethod = method;
        req.requestBody = Blob.valueOf(body);
        if(headers != null){
            for(String key: headers.keySet()){
                req.headers.put(key, headers.get(key));
            }
        }
        RestContext.request = req;
        RestContext.response = res;
    }
}