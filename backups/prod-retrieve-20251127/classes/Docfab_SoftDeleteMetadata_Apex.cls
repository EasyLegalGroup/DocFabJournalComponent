/*
   * @ Version : 1.0
   * @ Created Date : 2022-02-24
   * @Description : This class is apex web service class to create/update object,field or picklist item.
*/
public with sharing class Docfab_SoftDeleteMetadata_Apex {
    /*
    * @Description  This method is to create object,field or picklist by checking the operation key in map.
    * @Return       DF_DocFabricator_Utility.ResponseReturnWrapper
    */
    public static DF_DocFabricator_Utility.ResponseReturnWrapper SoftDeleteDocfabModel(String requestbody) {
        DF_DocFabricator_Utility.ResponseReturnWrapper responseReturnWrapperInstance = new DF_DocFabricator_Utility.ResponseReturnWrapper();
            DF_DocFabricator_Utility.RequestBodyPayloadWrapper requestBodyPayloadWrapperInstance = new DF_DocFabricator_Utility.RequestBodyPayloadWrapper();
            requestBodyPayloadWrapperInstance = (DF_DocFabricator_Utility.RequestBodyPayloadWrapper)JSON.deserialize(requestbody,DF_DocFabricator_Utility.RequestBodyPayloadWrapper.class);

                switch on requestBodyPayloadWrapperInstance.operation {
                    when 'SOFT_DELETE_MODEL' {
                        responseReturnWrapperInstance = DF_DocFabricator_Utility.SoftDeleteDocfabMetadata(requestBodyPayloadWrapperInstance,'CustomObject');
                    }
                    when 'SOFT_DELETE_FIELD' {
                        responseReturnWrapperInstance = DF_DocFabricator_Utility.SoftDeleteDocfabMetadata(requestBodyPayloadWrapperInstance,'CustomField');
                    }
                    when 'SOFT_DELETE_PICKLIST_ITEM' {
                        responseReturnWrapperInstance = DF_DocFabricator_Utility.DeleteDocfabPicklistItem(requestBodyPayloadWrapperInstance);//.CreateDocfabModelPicklistItem(requestBodyPayloadWrapperInstance);
                    }
                    when else {
                        responseReturnWrapperInstance = DF_DocFabricator_Utility.CreateReturnResponse('Unknown operation.', 500);
                    }
                }
                DFJ_ErrorLogController.addErrorLogs('', 'Softdeleting the metadatas.', String.valueOf(requestbody), 'Error', 'Docfab_DocFabricatorDeleteMetadata_Apex.createDocfabModel apex class method.', '', '');
        
        return responseReturnWrapperInstance;
    }
}