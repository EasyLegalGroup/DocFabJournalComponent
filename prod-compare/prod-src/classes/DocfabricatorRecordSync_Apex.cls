/**
   * @ Version : 1.0
   * @ Created Date : 16/05/2022
   * @Description : Restresource to handle the record sync callouts request.
*/
@RestResource(urlMapping='/v1/recordSync/*')
global without sharing class DocfabricatorRecordSync_Apex {
    /*
    * @Description  
    * @Return       RestResponse
    */
    // @HttpGet
    // global static void GetRecordSyncData() {
    //     RestRequest request = RestContext.request;
    //     RestResponse responseToSend = RestContext.response;
    //     DF_RecordSync_Utility.RestResponseWrapper restResponseWrapperInstance = new DF_RecordSync_Utility.RestResponseWrapper();
    //     try {
    //         DocFab_User_Setting__c docfabUserCustomSetting = DocFab_User_Setting__c.getOrgDefaults();
    //         String requestToken = request.headers.containsKey('Authorization-Key') ? request.headers.get('Authorization-Key') : '';
    //         if (!String.isBlank(requestToken) && docfabUserCustomSetting.Model_Service_Key__c.equals(requestToken)) {
    //             // TODO : HTTP delete
    //             System.debug('In @HttpGet');
    //         }
    //     } catch (Exception ex) {
    //         //responseReturnWrapperInstance = DFJ_Utility.CreateReturnResponse('Server error.', 500);
    //         DFJ_ErrorController.addErrorLogs('', 'Getting record sync related data.', ex.getMessage(), 'Error', 'DocfabricatorRecordSync_Apex.GetRecordSyncData apex class.', String.valueOf(ex.getLineNumber()));
    //     }
    //     responseToSend.responseBody = Blob.valueOf(restResponseWrapperInstance.message);
    //     responseToSend.statusCode = restResponseWrapperInstance.statusCode;
    // }

    /*
    * @Description  
    * @Return       RestResponse
    */
    @HttpPost
    global static void CreateRecordSyncData() {
        RestRequest request = RestContext.request;
        RestResponse responseToSend = RestContext.response;
        DF_RecordSync_Utility.RestResponseWrapper restResponseWrapperInstance = new DF_RecordSync_Utility.RestResponseWrapper();
        //DFJ_Utility.ResponseReturnWrapper responseReturnWrapperInstance = new DFJ_Utility.ResponseReturnWrapper();
        try {

            //System.debug('request >>> '+JSON.serialize(request.requestBody));
            DocFab_User_Setting__c docfabUserCustomSetting = DocFab_User_Setting__c.getOrgDefaults();
            String requestToken = request.headers.containsKey('Authorization-Key') ? request.headers.get('Authorization-Key') : '';
            if (!String.isBlank(requestToken) && docfabUserCustomSetting.Model_Service_Key__c.equals(requestToken)) {
                restResponseWrapperInstance = DF_RecordSync_Utility.parseAndPerformDml(request.requestBody.tostring(),'POST');
                // DFJ_ErrorLogController.addErrorLogs('', 'records sync.','Returned value >>> '+DF_RecordSync_Utility.parseAndPerformDml(request.requestBody.tostring()), '', 'DocfabricatorRecordSync_Apex.CreateRecordSyncData apex class.', '', '');
            }else{
                restResponseWrapperInstance = DF_RecordSync_Utility.buildReturnResponse(401, 'Unauthorized Access.');
            }
            
        } catch (Exception ex) {
            DFJ_ErrorLogController.addErrorLogs('', 'records sync.',ex.getMessage(), '', 'DocfabricatorRecordSync_Apex.CreateRecordSyncData apex class.', '', String.valueOf(ex.getLineNumber()));
            restResponseWrapperInstance = DF_RecordSync_Utility.buildReturnResponse(500,ex.getMessage());
        }
        responseToSend.responseBody = Blob.valueOf(restResponseWrapperInstance.message);
        responseToSend.statusCode = restResponseWrapperInstance.statusCode;
    }

    /*
    * @Description  
    * @Return       RestResponse
    */
    @HttpPut
    global static void UpdateRecordSyncData() {
        RestRequest request = RestContext.request;
        RestResponse responseToSend = RestContext.response;
        DF_RecordSync_Utility.RestResponseWrapper restResponseWrapperInstance = new DF_RecordSync_Utility.RestResponseWrapper();
        //DFJ_Utility.ResponseReturnWrapper responseReturnWrapperInstance = new DFJ_Utility.ResponseReturnWrapper();
        try {
            DocFab_User_Setting__c docfabUserCustomSetting = DocFab_User_Setting__c.getOrgDefaults();
            String requestToken = request.headers.containsKey('Authorization-Key') ? request.headers.get('Authorization-Key') : '';
            if (!String.isBlank(requestToken) && docfabUserCustomSetting.Model_Service_Key__c.equals(requestToken)) {
                // TODO : HTTP put
                //System.debug('In @HttpPut >>>');
                restResponseWrapperInstance = DF_RecordSync_Utility.parseAndPerformDml(request.requestBody.tostring(),'PUT');
            }else{
                restResponseWrapperInstance = DF_RecordSync_Utility.buildReturnResponse(401, 'Unauthorized Access.');
            }
        } catch (Exception ex) {
            DFJ_ErrorLogController.addErrorLogs('', 'Updating record using record sync.', ex.getMessage(), 'Error', 'DocfabricatorRecordSync_Apex.UpdateRecordSyncData', '', String.valueOf(ex.getLineNumber()));
            restResponseWrapperInstance = DF_RecordSync_Utility.buildReturnResponse(500,ex.getMessage());
        }
        responseToSend.responseBody = Blob.valueOf(restResponseWrapperInstance.message);
        responseToSend.statusCode = restResponseWrapperInstance.statusCode;
    }

    /*
    * @Description  
    * @Return       RestResponse
    */
    @HttpDelete
    global static void DeleteRecordSyncData() {
        RestRequest request = RestContext.request;
        RestResponse responseToSend = RestContext.response;
        DF_RecordSync_Utility.RestResponseWrapper restResponseWrapperInstance = new DF_RecordSync_Utility.RestResponseWrapper();
        //DFJ_Utility.ResponseReturnWrapper responseReturnWrapperInstance = new DFJ_Utility.ResponseReturnWrapper();
        try {
            // System.debug('request >>> '+JSON.serialize(request));
            // System.debug('URI >>> '+JSON.serialize(request.requestURI));
            // System.debug('URI >>> '+JSON.serialize(request.requestBody));
            DocFab_User_Setting__c docfabUserCustomSetting = DocFab_User_Setting__c.getOrgDefaults();
            String requestToken = request.headers.containsKey('Authorization-Key') ? request.headers.get('Authorization-Key') : '';
            if (!String.isBlank(requestToken) && docfabUserCustomSetting.Model_Service_Key__c.equals(requestToken)) {
                restResponseWrapperInstance = DF_RecordSync_Utility.parseAndPerformDml(request.requestBody.tostring(),'DELETE');
                // restResponseWrapperInstance = DF_RecordSync_Utility.deleteObjectRecords(request.requestBody.tostring(),'DELETE');
                // TODO : HTTP delete
                //System.debug('In @HttpDelete');
            }else{
                restResponseWrapperInstance = DF_RecordSync_Utility.buildReturnResponse(401, 'Unauthorized Access.');
            }
        } catch (Exception ex) {
            DFJ_ErrorLogController.addErrorLogs('', 'Deleting record using record sync', ex.getMessage(), 'Error', 'DocfabricatorRecordSync_Apex.DeleteRecordSyncData', '', String.valueOf(ex.getLineNumber()));
            restResponseWrapperInstance = DF_RecordSync_Utility.buildReturnResponse(500, ex.getMessage());
        }
        responseToSend.responseBody = Blob.valueOf(restResponseWrapperInstance.message);
        responseToSend.statusCode = restResponseWrapperInstance.statusCode;
    }
}