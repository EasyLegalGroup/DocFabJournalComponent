/*
   * @ Version : 1.0
   * @ Created Date : 2021-08-27
   * @Description : This class is apex web service class to create/update object,field or picklist item.
*/
// @RestResource(urlMapping='/v1/createMetadata/')
public with sharing class Docfab_DocFabricatorCreateMetadata_Apex {
    /*
    * @Description  This method is to create object,field or picklist by checking the operation key in map.
    * @Return       DF_DocFabricator_Utility.ResponseReturnWrapper
    */
    public static DF_DocFabricator_Utility.ResponseReturnWrapper CreateDocfabModel(String requestbody) {
        DF_DocFabricator_Utility.ResponseReturnWrapper responseReturnWrapperInstance = new DF_DocFabricator_Utility.ResponseReturnWrapper();
            DF_DocFabricator_Utility.RequestBodyPayloadWrapper requestBodyPayloadWrapperInstance = new DF_DocFabricator_Utility.RequestBodyPayloadWrapper();
            requestBodyPayloadWrapperInstance = (DF_DocFabricator_Utility.RequestBodyPayloadWrapper)JSON.deserialize(requestbody,DF_DocFabricator_Utility.RequestBodyPayloadWrapper.class);
            switch on requestBodyPayloadWrapperInstance.operation {
                when 'CREATE_MODEL' {
                    responseReturnWrapperInstance = DF_DocFabricator_Utility.CreateDocfabObjectModel(requestBodyPayloadWrapperInstance);
                }
                when 'CREATE_FIELD' {
                    responseReturnWrapperInstance = DF_DocFabricator_Utility.CreateDocfabModelField(requestBodyPayloadWrapperInstance);
                }
                when 'CREATE_PICKLIST_ITEM' {
                    responseReturnWrapperInstance = DF_DocFabricator_Utility.CreateDocfabModelPicklistItem(requestBodyPayloadWrapperInstance);
                }
                when else {
                    responseReturnWrapperInstance = DF_DocFabricator_Utility.CreateReturnResponse('Unknown operation.', 500);
                }
            }
        return responseReturnWrapperInstance;
    }

}