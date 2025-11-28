/*
   * @ Version : 1.0
   * @ Created Date : 2021-08-27
   * @Description : This class is apex web service class to update object,field or picklist item.
*/
public with sharing class Docfab_DocFabricatorUpdateMetadata_Apex {
    /*
    * @Description  This http POST update object,field or picklist by checking the operation key in map.
    * @Return       DF_DocFabricator_Utility.ResponseReturnWrapper
    */
    public static DF_DocFabricator_Utility.ResponseReturnWrapper UpdateDocfabModel(String requestbody) {
        DF_DocFabricator_Utility.ResponseReturnWrapper responseReturnWrapperInstance = new DF_DocFabricator_Utility.ResponseReturnWrapper();
            DF_DocFabricator_Utility.RequestBodyPayloadWrapper requestBodyPayloadWrapperInstance = new DF_DocFabricator_Utility.RequestBodyPayloadWrapper();
            requestBodyPayloadWrapperInstance = (DF_DocFabricator_Utility.RequestBodyPayloadWrapper)JSON.deserialize(requestbody,DF_DocFabricator_Utility.RequestBodyPayloadWrapper.class);
            switch on requestBodyPayloadWrapperInstance.operation {
                when 'UPDATE_MODEL' {
                    responseReturnWrapperInstance = DF_DocFabricator_Utility.CreateDocfabObjectModel(requestBodyPayloadWrapperInstance);
                }
                when 'UPDATE_FIELD' {
                    responseReturnWrapperInstance = DF_DocFabricator_Utility.CreateDocfabModelField(requestBodyPayloadWrapperInstance);
                }
                when 'UPDATE_PICKLIST_ITEM' {
                    responseReturnWrapperInstance = DF_DocFabricator_Utility.CreateDocfabModelPicklistItem(requestBodyPayloadWrapperInstance);
                }
                when else {
                    responseReturnWrapperInstance.Message = 'Unknown operation.';
                    responseReturnWrapperInstance.statuscode = 500;
                   // System.debug('Default case');
                }
            }
        return responseReturnWrapperInstance;
    }
}