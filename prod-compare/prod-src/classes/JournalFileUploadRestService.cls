@RestResource(urlMapping='/uploadFilesToJournal/*')
global class JournalFileUploadRestService {
	@HttpPost
    global static void uploadFileToAccount(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        try {
            String journalName = req.requestURI.substring(req.requestURI.lastIndexOf('/') + 1);
            List<Journal__c> journalRecord = [SELECT Id, Name FROM Journal__c WHERE Name =: journalName LIMIT 1];
            Map<String, String> responseObj = new Map<String, String>();
            if (journalRecord.isEmpty()) {
                throw new CustomException('Invalid Journal Name');
            }
    
            Blob fileBody = req.requestBody;
            String fileName = req.headers.get('File-Name');
            if (fileBody.size() == 0 || fileName == null || String.isBlank(fileName)) {
                throw new CustomException('Either file content or file name is missing');
            }
    
            ContentVersion contentVersion = new ContentVersion(
                Title = fileName,
                PathOnClient = fileName + '.pdf',
                VersionData = fileBody,
                ContentLocation = 'S',
                IsMajorVersion = true
            );
            insert contentVersion;
            
            ContentDocument contentDoc = [SELECT Id FROM ContentDocument WHERE LatestPublishedVersionId = :contentVersion.Id LIMIT 1];
            
            ContentDocumentLink contentLink = new ContentDocumentLink(
                ContentDocumentId = contentDoc.Id,
                LinkedEntityId = journalRecord[0].Id,
                ShareType = 'V',
                Visibility = 'AllUsers'
            );
            insert contentLink;
    
            res.statuscode = 200;
            res.responseBody = Blob.valueOf('File uploaded successfully');
        } catch (Exception e) {
            res.statuscode = 400;
            res.responseBody = Blob.valueOf(e.getMessage());
        }
    }

    global class CustomException extends Exception {}
}