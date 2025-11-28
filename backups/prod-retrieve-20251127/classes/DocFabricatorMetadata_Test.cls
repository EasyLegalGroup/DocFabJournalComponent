/**
   * @date : 2021-03-25
   * @description : This class contains the test methods of the class - DocFabricatorMetadata
*/
@IsTest
public with sharing class DocFabricatorMetadata_Test {

    public class WebServiceMockImplForDocfab implements WebServiceMock
	{
    public void doInvoke(Object stub, Object request, Map<String, Object> response,String endpoint, String soapAction, String requestName,String responseNS, String responseName, String responseType){

			if(request instanceof MetadataService.createMetadata_element)
			{
				MetadataService.createMetadataResponse_element responseElement = new MetadataService.createMetadataResponse_element();
				MetadataService.SaveResult saveResult = new MetadataService.SaveResult();
				saveResult.success = true;
                saveResult.errors = null;
				responseElement.result = new MetadataService.SaveResult[] { saveResult };
				response.put('response_x', responseElement);
			} else if(request instanceof MetadataService.upsertMetadata_element){
                MetadataService.upsertMetadataResponse_element responseElement = new MetadataService.upsertMetadataResponse_element();
				MetadataService.UpsertResult upsertResult = new MetadataService.UpsertResult();
				upsertResult.success = true;
                upsertResult.errors = null;
                upsertResult.created = true;
				responseElement.result = new MetadataService.UpsertResult[] { upsertResult };
				response.put('response_x', responseElement);
            } else if(request instanceof MetadataService.updateMetadata_element){
                MetadataService.updateMetadataResponse_element responseElement = new MetadataService.updateMetadataResponse_element();
				MetadataService.SaveResult updateResult = new MetadataService.SaveResult();
				updateResult.success = true;
                updateResult.errors = null;
				responseElement.result = new MetadataService.SaveResult[] { updateResult };
				response.put('response_x', responseElement);
            }   else if(request instanceof MetadataService.deleteMetadata_element){
                MetadataService.deleteMetadataResponse_element responseElement = new MetadataService.deleteMetadataResponse_element();
				MetadataService.DeleteResult deleteResult = new MetadataService.DeleteResult();
				deleteResult.success = true;
				deleteResult.errors = null;
				responseElement.result = new MetadataService.DeleteResult[] { deleteResult };
				response.put('response_x', responseElement);
            }  else if(request instanceof MetadataService.renameMetadata_element){
                MetadataService.renameMetadataResponse_element responseElement = new MetadataService.renameMetadataResponse_element();
				MetadataService.SaveResult saveResult = new MetadataService.SaveResult();
				saveResult.success = true;
				responseElement.result = saveResult ;
				response.put('response_x', responseElement);
            } else if(request instanceof MetadataService.readMetadata_element){
                MetadataService.readCustomFieldResponse_element permSetResult = new MetadataService.readCustomFieldResponse_element();
                MetadataService.ReadCustomFieldResult readResult = new MetadataService.ReadCustomFieldResult();
                readResult = (MetadataService.ReadCustomFieldResult) JSON.deserialize('{"records_type_info":["records","http://soap.sforce.com/2006/04/metadata",null,"0","-1","false"],"records":[{"fullName":null,"writeRequiresMasterRead_type_info":["writeRequiresMasterRead","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"writeRequiresMasterRead":null,"visibleLines_type_info":["visibleLines","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"visibleLines":null,"valueSet_type_info":["valueSet","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"valueSet":{"valueSettings_type_info":["valueSettings","http://soap.sforce.com/2006/04/metadata",null,"0","-1","false"],"valueSettings":null,"valueSetName_type_info":["valueSetName","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"valueSetName":null,"valueSetDefinition_type_info":["valueSetDefinition","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"valueSetDefinition":{"value_type_info":["value","http://soap.sforce.com/2006/04/metadata",null,"0","-1","false"],"value":[{"fullName":null,"type_att_info":["xsi:type"],"type":"CustomValue","label_type_info":["label","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"label":"None","isActive_type_info":["isActive","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"isActive":null,"fullName_type_info":["fullName","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"fullName":"None","field_order_type_info":["fullName","color","default_x","description","isActive","label"],"description_type_info":["description","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"description":null,"default_x_type_info":["default","http://soap.sforce.com/2006/04/metadata",null,"1","1","false"],"default_x":false,"color_type_info":["color","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"color":null,"apex_schema_type_info":["http://soap.sforce.com/2006/04/metadata","true","false"]}],"sorted_type_info":["sorted","http://soap.sforce.com/2006/04/metadata",null,"1","1","false"],"sorted":false,"field_order_type_info":["sorted","value"],"apex_schema_type_info":["http://soap.sforce.com/2006/04/metadata","true","false"]},"restricted_type_info":["restricted","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"restricted":null,"field_order_type_info":["controllingField","restricted","valueSetDefinition","valueSetName","valueSettings"],"controllingField_type_info":["controllingField","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"controllingField":null,"apex_schema_type_info":["http://soap.sforce.com/2006/04/metadata","true","false"]},"unique_type_info":["unique","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"unique":null,"type_x_type_info":["type","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"type_x":"Picklist","type_att_info":["xsi:type"],"type":"CustomField","trackTrending_type_info":["trackTrending","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"trackTrending":false,"trackHistory_type_info":["trackHistory","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"trackHistory":null,"trackFeedHistory_type_info":["trackFeedHistory","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"trackFeedHistory":null,"summaryOperation_type_info":["summaryOperation","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"summaryOperation":null,"summaryForeignKey_type_info":["summaryForeignKey","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"summaryForeignKey":null,"summaryFilterItems_type_info":["summaryFilterItems","http://soap.sforce.com/2006/04/metadata",null,"0","-1","false"],"summaryFilterItems":null,"summarizedField_type_info":["summarizedField","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"summarizedField":null,"stripMarkup_type_info":["stripMarkup","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"stripMarkup":null,"startingNumber_type_info":["startingNumber","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"startingNumber":null,"securityClassification_type_info":["securityClassification","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"securityClassification":null,"scale_type_info":["scale","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"scale":null,"restrictedAdminField_type_info":["restrictedAdminField","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"restrictedAdminField":null,"required_type_info":["required","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"required":false,"reparentableMasterDetail_type_info":["reparentableMasterDetail","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"reparentableMasterDetail":null,"relationshipOrder_type_info":["relationshipOrder","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"relationshipOrder":null,"relationshipName_type_info":["relationshipName","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"relationshipName":null,"relationshipLabel_type_info":["relationshipLabel","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"relationshipLabel":null,"referenceTo_type_info":["referenceTo","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"referenceTo":null,"referenceTargetField_type_info":["referenceTargetField","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"referenceTargetField":null,"precision_type_info":["precision","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"precision":null,"populateExistingRows_type_info":["populateExistingRows","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"populateExistingRows":null,"metadataRelationshipControllingField_type_info":["metadataRelationshipControllingField","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"metadataRelationshipControllingField":null,"maskType_type_info":["maskType","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"maskType":null,"maskChar_type_info":["maskChar","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"maskChar":null,"lookupFilter_type_info":["lookupFilter","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"lookupFilter":null,"length_type_info":["length","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"length":null,"label_type_info":["label","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"label":"TestPick","isSortingDisabled_type_info":["isSortingDisabled","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"isSortingDisabled":null,"isNameField_type_info":["isNameField","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"isNameField":null,"isFilteringDisabled_type_info":["isFilteringDisabled","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"isFilteringDisabled":null,"isConvertLeadDisabled_type_info":["isConvertLeadDisabled","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"isConvertLeadDisabled":null,"inlineHelpText_type_info":["inlineHelpText","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"inlineHelpText":null,"fullName_type_info":["fullName","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"fullName":"docfab_newtestobjDFJ_ABC__c.testpick__c","formulaTreatBlanksAs_type_info":["formulaTreatBlanksAs","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"formulaTreatBlanksAs":null,"formula_type_info":["formula","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"formula":null,"fieldManageability_type_info":["fieldManageability","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"fieldManageability":null,"field_order_type_info":["fullName","businessOwnerGroup","businessOwnerUser","businessStatus","caseSensitive","customDataType","defaultValue","deleteConstraint","deprecated","description","displayFormat","displayLocationInDecimal","encrypted","escapeMarkup","externalDeveloperName","externalId","fieldManageability","formula","formulaTreatBlanksAs","inlineHelpText","isConvertLeadDisabled","isFilteringDisabled","isNameField","isSortingDisabled","label","length","lookupFilter","maskChar","maskType","metadataRelationshipControllingField","populateExistingRows","precision","referenceTargetField","referenceTo","relationshipLabel","relationshipName","relationshipOrder","reparentableMasterDetail","required","restrictedAdminField","scale","securityClassification","startingNumber","stripMarkup","summarizedField","summaryFilterItems","summaryForeignKey","summaryOperation","trackFeedHistory","trackHistory","trackTrending","type_x","unique","valueSet","visibleLines","writeRequiresMasterRead"],"externalId_type_info":["externalId","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"externalId":false,"externalDeveloperName_type_info":["externalDeveloperName","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"externalDeveloperName":null,"escapeMarkup_type_info":["escapeMarkup","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"escapeMarkup":null,"encrypted_type_info":["encrypted","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"encrypted":null,"displayLocationInDecimal_type_info":["displayLocationInDecimal","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"displayLocationInDecimal":null,"displayFormat_type_info":["displayFormat","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"displayFormat":null,"description_type_info":["description","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"description":null,"deprecated_type_info":["deprecated","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"deprecated":null,"deleteConstraint_type_info":["deleteConstraint","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"deleteConstraint":null,"defaultValue_type_info":["defaultValue","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"defaultValue":null,"customDataType_type_info":["customDataType","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"customDataType":null,"caseSensitive_type_info":["caseSensitive","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"caseSensitive":null,"businessStatus_type_info":["businessStatus","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"businessStatus":null,"businessOwnerUser_type_info":["businessOwnerUser","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"businessOwnerUser":null,"businessOwnerGroup_type_info":["businessOwnerGroup","http://soap.sforce.com/2006/04/metadata",null,"0","1","false"],"businessOwnerGroup":null,"apex_schema_type_info":["http://soap.sforce.com/2006/04/metadata","true","false"]}],"field_order_type_info":["records"],"apex_schema_type_info":["http://soap.sforce.com/2006/04/metadata","true","false"]}', MetadataService.ReadCustomFieldResult.class);

                permSetResult.result = readResult;
				response.put('response_x', permSetResult);
            }
			return;
		}
    }

    @isTest static void CreateDocfabModel_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "CREATE_MODEL","type": "MAIN","parent": "","name": "Test Model","description":"TestModel","api_name": "TestModel"}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        // Call the method to test
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(200, response.statusCode);
    }

    @isTest static void CreateDocfabModelForCatch_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = null;
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "CREATE_MODEL","type": "MAIN","parent": "","name": "Test Model","description":"TestModel","api_name": "TestModel"}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(500, response.statusCode);
    }

    @isTest static void CreateDocfabModelReqBodyEmpty_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "","type": "MAIN","parent": "","name": "Test Model","description":"TestModel","api_name": "TestModel"}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(500, response.statusCode);
    }

    @isTest static void CreateDocfabModelReqBodyMalformed_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "CREATE_MODEL""type": "MAIN","parent": "","name": "Test Model","description":"TestModel","api_name": "TestModel"');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(500, response.statusCode);
    }

    @isTest static void CreateDocfabModelNameEmpty_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();        
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "CREATE_MODEL","type": "MAIN","parent": "","name": "","description":"TestModel","api_name": ""}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(500, response.statusCode);
    }

    @isTest static void CreateDocfabModelTypeEmpty_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();        
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "CREATE_MODEL","type": "","parent": "","name": "TestModel","description":"TestModel","api_name": "TestModel"}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(500, response.statusCode);
    }

    @isTest static void CreateDocfabModelCreateSublist_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "CREATE_MODEL","type": "SUBLIST","parent_model": "TestModel","name": "TestSub","description":"TestModel","api_name": "TestSub"}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(200, response.statusCode);
    }

    @isTest static void CreateDocfabModelWithDifferentType_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "CREATE_MODEL","type": "OTHER","parent": "Abc","name": "Other","description":"TestModel","api_name": "TestModel"}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(500, response.statusCode);
    }

    @isTest static void CreateDocfabModelWithNullBody_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"Operation":"CREATE_MODEL"');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(500, response.statusCode);
    }

    @isTest static void CreateDocfabModelOperationEmpty_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "","type": "OTHER","parent": "Abc","name": "Other","description":"TestModel","api_name": "TestModel"}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(500, response.statusCode);
    }

    @isTest static void CreateDocfabModelUnknownOperationEmpty_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "CREATE_OTHER","type": "OTHER","parent": "Abc","name": "Other","description":"TestModel","api_name": "TestModel"}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(500, response.statusCode);
    }

    @isTest static void CreateDocfabModelTextField_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "CREATE_FIELD","record_model": "TestModel","name": "TextField","description": "TextField","api_name": "TextField","type": "TEXT"}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(200, response.statusCode);
    }

    @isTest static void CreateDocfabModelNumberField_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "CREATE_FIELD","record_model": "TestModel","name": "TextField","description": "TextField","api_name": "TextField","type": "Number"}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(200, response.statusCode);
    }

    @isTest static void CreateDocfabModelBooleanField_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "CREATE_FIELD","record_model": "TestModel","name": "TextField","description": "TextField","api_name": "TextField","type": "Boolean"}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(200, response.statusCode);
    }

    @isTest static void CreateDocfabModelPicklistField_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "CREATE_FIELD","record_model": "TestModel","name": "TextField","description": "TextField","api_name": "TextField","type": "Picklist"}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        //System.assertEquals(500, response.statusCode);
    }

    @isTest static void CreateDocfabModelDatetimeField_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());
        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "CREATE_FIELD","record_model": "TestModel","name": "TextField","description": "TextField","api_name": "TextField","type": "Datetime"}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(200, response.statusCode);
    }

    @isTest static void CreateDocfabModelSublistTextField_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());
        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"parent_model": "Abc","operation": "CREATE_FIELD","record_model": "TestModel","name": "TextField","description": "TextField","api_name": "TextField","type": "TEXT"}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(200, response.statusCode);
    }

    //Changes DIN-348 
    //Start
    @isTest static void CreateDocfabModelLongAreaTextField_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "CREATE_FIELD","record_model": "TestModel","name": "LongAreaTextField","description": "LongAreaTextField","api_name": "LongAreaTextField","type": "LONGTEXT"}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(200, response.statusCode);
    }
                                                                                      
    @isTest static void CreateDocfabModelFieldAPi32_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();
        Docfab_FieldAPI_Setting__c fieldApiSetting = new Docfab_FieldAPI_Setting__c();
        fieldApiSetting.FieldAPI_Postfix__c = 0;
        insert fieldApiSetting;
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "CREATE_FIELD","record_model": "TestModel","name": "skal der indsttes subsidire fuldmgtigessss ???","description": "LongAreaTextField","api_name": "skal_der_indsttes_subsidire_fuldmgtige","type": "LONGTEXT"}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(200, response.statusCode);
    }

    //End

    @isTest static void CreateDocfabModelFieldNameEmpty_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "CREATE_FIELD","record_model": "TestModel","name": "","description": "TextField","api_name": "","type": "TEXT"}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(500, response.statusCode);
    }

    @isTest static void CreateDocfabModelPicklistItem_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"parent_model":"","operation": "CREATE_PICKLIST_ITEM","record_model": "TestModel","field_api_name": "TestPicklist","name": "One","description": "One","api_name": "One"}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        // Call the method to test
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        //System.assertEquals(500, response.statusCode);
    }

    @isTest static void CreateDocfabModelSublistPicklistItem_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"parent_model":"Sublist","operation": "CREATE_PICKLIST_ITEM","record_model": "TestSublist","field_api_name": "TestPicklist","name": "OneSub","description": "OneSub","api_name": "OneSub"}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        // Call the method to test
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        //System.assertEquals(500, response.statusCode);
    }

    @isTest static void UpdateDocfabModel_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "UPDATE_MODEL","name": "TestModel","description": "TestModel","api_name": "TestModel","parent":""}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        // Call the method to test
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(200, response.statusCode);
    }

    //Chnages DIN-348 
    //Start
    @isTest static void UpdateDocfabField_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());
        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "UPDATE_FIELD","record_model":"Account","name": "Name","description": "Account Name","api_name": "Name"}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(200, response.statuscode);
    }
    //End

    @isTest static void UpdateDocfabModelServiceNull_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "UPDATE_MODEL","name": "TestModel","description": "TestModel","api_name": "TestModel","parent":""}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        // Call the method to test
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(200, response.statusCode);
    }

    @isTest static void UpdateDocfabModelUnknownOperation_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "UPDATE_UNKNOWN","name": "TestModel","description": "TestModel","api_name": "TestModel","parent":""}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        // Call the method to test
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(500, response.statusCode);
    }

    @isTest static void UpdateDocfabModelCatchCover_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "UPDATE_UNKNOWN","name": "TestModel"}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        // Call the method to test
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(500, response.statusCode);
    }

    @isTest static void DeletaDocfabModel_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "DELETE_MODEL","api_name": "TestModel","parent":""}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        // Call the method to test
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(500, response.statusCode);
    }

    // @isTest static void DeletaDocfabModelEndpointNull_Test() {
    //     DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
    //     Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
    //     System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

    //     RestRequest request = new RestRequest();
    //     RestResponse response = new RestResponse();

    //     request.requestURI = null;
    //     request.httpMethod = 'POST';

    //     request.requestBody = Blob.valueOf('{"operation": "DELETE_FIELD","record_model": "TestModel","api_name": "TestPicklist","parent":""}');
    //     request.addHeader('Authorization-Key', 'aa11bb22cc33');
    //     RestContext.request = request;
    //     RestContext.response = response;
    //     // Call the method to test
    //     Test.startTest();
    //     DocFabricatorMetadata_Apex.CreateDocfabModel();
    //     Test.stopTest();
    //     System.assertEquals(200, response.statusCode);
    // }

    // @isTest static void DeletaDocfabModelField_Test() {
    //     DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
    //     Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
    //     System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

    //     RestRequest request = new RestRequest();
    //     RestResponse response = new RestResponse();

    //     request.requestURI = '/services/apexrest/v1/metadata/';
    //     request.httpMethod = 'POST';
    //     request.requestBody = Blob.valueOf('{"operation": "DELETE_FIELD","record_model": "TestModel","api_name": "TestPicklist","parent":""}');

    //     request.addHeader('Authorization-Key', 'aa11bb22cc33');
    //     RestContext.request = request;
    //     RestContext.response = response;
    //     // Call the method to test
    //     Test.startTest();
    //     DocFabricatorMetadata_Apex.CreateDocfabModel();
    //     Test.stopTest();
    //     System.assertEquals(200, response.statusCode);
    // }

    @isTest static void DeletaDocfabModelPicklistItem_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';

        request.requestBody = Blob.valueOf('{"operation": "DELETE_PICKLIST_ITEM","record_model": "TestModel","TestModel": "TestPicklist","api_name": "One"}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        // Call the method to test
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        // Delete meta
        System.assertEquals(500, response.statusCode);
    }

    @isTest static void DeletaDocfabModelOperationUnknown_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "DELETE_UNKNOWN","api_name": "TestModel","parent":""}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        // Call the method to test
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(500, response.statusCode);
    }

    //----------------------------delete End

    //------------SoftDelete--------------

    @isTest static void SoftDeletaDocfabModel_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "SOFT_DELETE_MODEL","api_name": "TestModel","deleted_api_name": "TestModel_ABC","parent":""}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        // Call the method to test
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        // Delete meta
        System.assertEquals(200, response.statusCode);
    }

    @isTest static void SoftDeletaDocfabModelEndpointNull_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = null;
        request.httpMethod = 'POST';

        request.requestBody = Blob.valueOf('{"operation": "SOFT_DELETE_MODEL","api_name": "TestModel","deleted_api_name": "TestModel_ABC","parent":""}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        // Call the method to test
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(200, response.statusCode);
    }

    @isTest static void SoftDeletaDocfabModelField_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "SOFT_DELETE_FIELD","record_model": "TestModel","api_name": "TestPicklist","deleted_api_name": "TestPicklist_ABC","parent_model":""}');

        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        // Call the method to test
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
       
        System.assertEquals(200, response.statusCode);
    }

    @isTest static void SoftDeletaDocfabModelPicklistItem_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';

        request.requestBody = Blob.valueOf('{"operation": "SOFT_DELETE_PICKLIST_ITEM","record_model": "TestModel","field_api_name": "TestPicklist","api_name": "One","deleted_api_name": "One1","parent_model":""}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        // Call the method to test
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(200, response.statusCode);
    }

    @isTest static void SoftDeletaDocfabModelOperationUnknown_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "SOFT_DELETE_UNKNOWN","api_name": "TestModel","parent":""}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        // Call the method to test
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(500, response.statusCode);
    }

    @isTest static void RecordModelNotAuthorized_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "SOFT_DELETE_UNKNOWN","api_name": "TestModel","parent":""}');
        request.addHeader('Authorization-Key', 'aa11bb');
        RestContext.request = request;
        RestContext.response = response;
        // Call the method to test
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
        System.assertEquals(401, response.statusCode);
    }

    @isTest static void UpdateCustomSetting_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        
        // Call the method to test
        Test.startTest();
        String updateResponse = DF_DocFabricator_Utility.UpdateDocfabUserSetting(docfabUserCustomSetting.Username__c, docfabUserCustomSetting.User_Password__c);
        String updateResponseBlank = DF_DocFabricator_Utility.UpdateDocfabUserSetting('abcd','');
        Test.stopTest();
        System.assertEquals('Something went wrong.', updateResponse);
        System.assertEquals('Username or parrword is blank', updateResponseBlank);
    }

    @isTest static void CreateDefaultField_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        
        // Call the method to test
        Test.startTest();
        DF_DocFabricator_Utility.ResponseReturnWrapper resInstance = DF_DocFabricator_Utility.CreateDefaultField(null);
        Test.stopTest();
        System.assertEquals(500, resInstance.statuscode);
    }

    @isTest static void HandleDeleteResultsOne_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        MetadataService.DeleteResult deleteResult = new MetadataService.DeleteResult();
        deleteResult.success = false;
        MetadataService.Error mdError = new MetadataService.Error();
        mdError.statusCode='500';
        mdError.message='Error';
        mdError.fields=new List<String>{'ABC','BCD'};
        deleteResult.errors = new List<MetadataService.Error>{mdError};
        deleteResult.fullName = 'fullname';
        // Call the method to test
        Test.startTest();
        DF_DocFabricator_Utility.ResponseReturnWrapper resInstance = DF_DocFabricator_Utility.HandleDeleteResults(deleteResult);
        Test.stopTest();
        System.assertEquals(500, resInstance.statuscode);
    }

    @isTest static void HandleDeleteResultsPropertyNull_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        MetadataService.DeleteResult deleteResult = new MetadataService.DeleteResult();
        deleteResult.success = false;
        MetadataService.Error mdError = new MetadataService.Error();
        mdError.statusCode='500';
        mdError.message='Error';
        mdError.fields=new List<String>{'ABC','BCD'};
        deleteResult.errors = new List<MetadataService.Error>{mdError};
        // Call the method to test
        Test.startTest();
        DF_DocFabricator_Utility.ResponseReturnWrapper resInstance = DF_DocFabricator_Utility.HandleDeleteResults(deleteResult);
        Test.stopTest();
        System.assertEquals(500, resInstance.statuscode);
    }

    @isTest static void HandleDeleteResultsTwo_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        MetadataService.DeleteResult deleteResult = new MetadataService.DeleteResult();
        deleteResult.success = false;
        deleteResult.errors = null;

        // deleteResult.errors = new MetadataService.Error();
        // Call the method to test
        Test.startTest();
        DF_DocFabricator_Utility.ResponseReturnWrapper resInstance = DF_DocFabricator_Utility.HandleDeleteResults(deleteResult);
        Test.stopTest();
        System.assertEquals(500, resInstance.statuscode);
    }

    @isTest static void HandleDeleteResultsNull_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        MetadataService.DeleteResult deleteResult = new MetadataService.DeleteResult();
        deleteResult.success = null;
        deleteResult.errors = null;

        // deleteResult.errors = new MetadataService.Error();
        // Call the method to test
        Test.startTest();
        DF_DocFabricator_Utility.ResponseReturnWrapper resInstance = DF_DocFabricator_Utility.HandleDeleteResults(deleteResult);
        Test.stopTest();
        System.assertEquals(500, resInstance.statuscode);
    }

    @isTest static void HandleUpsertResultsOne_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        MetadataService.UpsertResult UpsertResult = new MetadataService.UpsertResult();
        UpsertResult.success = true;
        UpsertResult.created = false;

        // Call the method to test
        Test.startTest();
        DF_DocFabricator_Utility.ResponseReturnWrapper resInstance = DF_DocFabricator_Utility.HandleUpsertResults(upsertResult);
        Test.stopTest();
        System.assertEquals(200, resInstance.statuscode);
    }

    @isTest static void HandleUpsertResultsTwo_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        MetadataService.UpsertResult UpsertResult = new MetadataService.UpsertResult();
        UpsertResult.success = false;

        MetadataService.Error mdError = new MetadataService.Error();
        mdError.statusCode='500';
        mdError.message='Error';
        mdError.fields=new List<String>{'ABC','BCD'};
        UpsertResult.errors = new List<MetadataService.Error>{mdError};
        // Call the method to test
        Test.startTest();
        DF_DocFabricator_Utility.ResponseReturnWrapper resInstance = DF_DocFabricator_Utility.HandleUpsertResults(upsertResult);
        Test.stopTest();
        System.assertEquals(500, resInstance.statuscode);
    }

    @isTest static void HandleDeleteResultsThree_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        MetadataService.UpsertResult UpsertResult = new MetadataService.UpsertResult();
        UpsertResult.success = false;
        UpsertResult.errors = null;

        // deleteResult.errors = new MetadataService.Error();
        // Call the method to test
        Test.startTest();
        DF_DocFabricator_Utility.ResponseReturnWrapper resInstance = DF_DocFabricator_Utility.HandleUpsertResults(upsertResult);
        Test.stopTest();
        System.assertEquals(500, resInstance.statuscode);
    }

    @isTest static void HandleUpsertResultsNull_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        MetadataService.UpsertResult UpsertResult = new MetadataService.UpsertResult();
        UpsertResult.success = null;
        UpsertResult.errors = null;

        // deleteResult.errors = new MetadataService.Error();
        // Call the method to test
        Test.startTest();
        DF_DocFabricator_Utility.ResponseReturnWrapper resInstance = DF_DocFabricator_Utility.HandleUpsertResults(upsertResult);
        Test.stopTest();
        System.assertEquals(500, resInstance.statuscode);
    }

    @isTest static void HandleSaveResultsOne_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        MetadataService.SaveResult SaveResult = new MetadataService.SaveResult();
        SaveResult.success = false;
        MetadataService.Error mdError = new MetadataService.Error();
        mdError.statusCode='500';
        mdError.message='Error';
        mdError.fields=new List<String>{'ABC','BCD'};
        SaveResult.errors = new List<MetadataService.Error>{mdError};
        saveResult.fullName = 'fullname';

        // Call the method to test
        Test.startTest();
        DF_DocFabricator_Utility.ResponseReturnWrapper resInstance = DF_DocFabricator_Utility.HandleSaveResults(saveResult);
        Test.stopTest();
        System.assertEquals(500, resInstance.statuscode);
    }

    @isTest static void HandleSaveResultsPropertyNull_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        MetadataService.SaveResult SaveResult = new MetadataService.SaveResult();
        SaveResult.success = false;
        MetadataService.Error mdError = new MetadataService.Error();
        mdError.statusCode='500';
        mdError.message='Error';
        mdError.fields=new List<String>{'ABC','BCD'};
        SaveResult.errors = new List<MetadataService.Error>{mdError};

        // Call the method to test
        Test.startTest();
        DF_DocFabricator_Utility.ResponseReturnWrapper resInstance = DF_DocFabricator_Utility.HandleSaveResults(saveResult);
        Test.stopTest();
        System.assertEquals(500, resInstance.statuscode);
    }

    @isTest static void HandleSaveResultsTwo_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        MetadataService.SaveResult SaveResult = new MetadataService.SaveResult();
        SaveResult.success = false;
        SaveResult.errors = null;

        // deleteResult.errors = new MetadataService.Error();
        // Call the method to test
        Test.startTest();
        DF_DocFabricator_Utility.ResponseReturnWrapper resInstance = DF_DocFabricator_Utility.HandleSaveResults(saveResult);
        Test.stopTest();
        System.assertEquals(500, resInstance.statuscode);
    }

    @isTest static void HandleSaveResultsNull_Test() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        MetadataService.SaveResult SaveResult = new MetadataService.SaveResult();
        SaveResult.success = false;
        SaveResult.errors = null;

        // deleteResult.errors = new MetadataService.Error();
        // Call the method to test
        Test.startTest();
        DF_DocFabricator_Utility.ResponseReturnWrapper resInstance = DF_DocFabricator_Utility.HandleSaveResults(saveResult);
        Test.stopTest();
        System.assertEquals(500, resInstance.statuscode);
    }
    //------------SoftDeleteEnd----------
    
    //Changes DFJ-68 Start
    
     @isTest static void CreateDocfabModelCreateSubSelectlist_Test1() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "CREATE_MODEL","type": "SUBSELECT","parent_model": "TestModel","name": "TestSub","description":"TestModel","api_name": "TestSub"}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
       // System.assertEquals(200, response.statusCode);
    }
                                                                                      
     @isTest static void CreateDocfabModelCreateSubSelectlist_Test2() {
        DocFab_User_Setting__c docfabUserCustomSetting = DFJ_TestDataFactory.createDocfabuserSettingRecord();
        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();
        Test.setMock(HttpCalloutMock.class, new Docfab_MetadataMock());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForDocfab());

        request.requestURI = '/services/apexrest/v1/metadata/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf('{"operation": "CREATE_FIELD","record_model": "Account","name": "Case","description": "TextField","api_name": "Case","type": "subselect"}');
        request.addHeader('Authorization-Key', 'aa11bb22cc33');
        RestContext.request = request;
        RestContext.response = response;
        Test.startTest();
        DocFabricatorMetadata_Apex.CreateDocfabModel();
        Test.stopTest();
      //  System.assertEquals(200, response.statusCode);
    }
      
       //End
}