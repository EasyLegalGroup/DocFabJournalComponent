/*
   * @ Version : 1.0
   * @ Created Date : 2022-02-22
   * @Description : This class is apex web service class which will redirect to the create, update and delete on the basis of operation.
*/
@RestResource(urlMapping='/v1/metadata/')
global without sharing class DocFabricatorMetadata_Apex {
    /*
    * @Description  This http POST will redirect the control according to the operation
    * @Return       RestResponse
    */
    @HttpPost
    global static void CreateDocfabModel() {
        RestRequest request = RestContext.request;
        RestResponse responseToSend = RestContext.response;
        DF_DocFabricator_Utility.ResponseReturnWrapper responseReturnWrapperInstance = new DF_DocFabricator_Utility.ResponseReturnWrapper();

        try {
            DocFab_User_Setting__c docfabUserCustomSetting = DocFab_User_Setting__c.getOrgDefaults();
            String requestToken = request.headers.containsKey('Authorization-Key') ? request.headers.get('Authorization-Key') : '';
            if (!String.isBlank(requestToken) && docfabUserCustomSetting.Model_Service_Key__c.equals(requestToken)) {
                DF_DocFabricator_Utility.RequestBodyPayloadWrapper requestBodyPayloadWrapperInstance = new DF_DocFabricator_Utility.RequestBodyPayloadWrapper();
                System.debug('requestBodyPayloadWrapperInstance >>> '+request.requestbody.tostring());
                requestBodyPayloadWrapperInstance = (DF_DocFabricator_Utility.RequestBodyPayloadWrapper)JSON.deserialize(request.requestbody.tostring(),DF_DocFabricator_Utility.RequestBodyPayloadWrapper.class);
                If(requestBodyPayloadWrapperInstance != null && !String.isBlank(requestBodyPayloadWrapperInstance.operation)){
                    responseReturnWrapperInstance =  requestBodyPayloadWrapperInstance.operation.contains('CREATE_') ? Docfab_DocFabricatorCreateMetadata_Apex.CreateDocfabModel(request.requestbody.toString()) : requestBodyPayloadWrapperInstance.operation.contains('UPDATE_') ? Docfab_DocFabricatorUpdateMetadata_Apex.UpdateDocfabModel(request.requestbody.toString()) : requestBodyPayloadWrapperInstance.operation.contains('SOFT_DELETE') ? Docfab_SoftDeleteMetadata_Apex.SoftDeleteDocfabModel(request.requestbody.toString()) : DF_DocFabricator_Utility.CreateReturnResponse('Unknown operation.', 500);//requestBodyPayloadWrapperInstance.operation.contains('DELETE') ? Docfab_DocFabricatorDeleteMetadata_Apex.DeleteDocfabModel(request.requestbody.toString()) : DF_DocFabricator_Utility.CreateReturnResponse('Unknown operation.', 500);
                }else {
                    responseReturnWrapperInstance.Message = 'Incorrect body received or operation propery not present.';
                    responseReturnWrapperInstance.statuscode = 500;
                }
            }else {
                responseReturnWrapperInstance.Message = 'Unauthorized Access.';
                responseReturnWrapperInstance.statuscode = 401;
            }
            DFJ_ErrorLogController.addErrorLogs('', 'Called the API services.', request.requestbody.toString()+ ' Headers : '+ request.headers, '', 'DocFabricatorMetadata_Apex apex class method.'+ responseReturnWrapperInstance.Message, '', '');
        } catch (Exception ex) {
            responseReturnWrapperInstance.Message = String.valueOf(ex.getMessage());
            responseReturnWrapperInstance.statusCode = 500;
            DFJ_ErrorLogController.addErrorLogs('finalTest', 'Called the API services.','Message : '+ responseReturnWrapperInstance.Message +'>>>'+ ex.getMessage(), 'Error', 'DocFabricatorMetadata_Apex apex class method.', '', String.valueOf(ex.getLineNumber()));
        }
        responseToSend.statusCode = responseReturnWrapperInstance.statuscode;
        responseToSend.responseBody = Blob.valueOf(responseReturnWrapperInstance.Message);
    }
}