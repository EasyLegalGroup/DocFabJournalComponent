/**
   * @Version : 1.0
   * @Created Date : 2021-03-25
   * @Description : This Mock class will be used for mocking metadata response.
*/
@isTest
global with sharing class Docfab_MetadataMock implements HttpCalloutMock {   

    global HTTPResponse respond(HTTPRequest req){
        HttpResponse res = new HttpResponse();
        String responseBody = '';

        if(req.getMethod().equals('POST')){
            
            if(req.getEndpoint().equals('https://test.salesforce.com/services/Soap/u/43.0')){

                responseBody = '<?xml version="1.0" encoding="UTF-8"?><soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:apex="http://soap.sforce.com/2006/08/apex" xmlns:cmd="http://soap.sforce.com/2006/04/metadata" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><soapenv:Header><cmd:SessionHeader><cmd:sessionId>00Di000000icUB!ASAAQF0stgINehCxOnHPLuLI4TMVx.jP8rEkLY5axmf0XWLfj0WFsmXhfHoFFgJ2gw1b2DImwyzSFPgB0wuIwNtG94ytkpoh</cmd:sessionId></cmd:SessionHeader></soapenv:Header><soapenv:Body></soapenv:Body></soapenv:Envelope>';
                res.setBody(responseBody);
                res.setStatusCode(200);
            }else if(req.getEndpoint().equals('https://login.salesforce.com/services/Soap/u/43.0')){
                responseBody = '<?xml version="1.0" encoding="UTF-8"?><soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:apex="http://soap.sforce.com/2006/08/apex" xmlns:cmd="http://soap.sforce.com/2006/04/metadata" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><soapenv:Header><cmd:SessionHeader><cmd:sessionId>00Di0000000icUB!ASAAQF0stgINehCxOnHPGuLI4TMVx.jP8rEkLY5axmf0XWLfj0WFsmXhfXoFFgJ2gw1b2DImwyzSFPgB2wuIwNtG94ytkpoh</cmd:sessionId></cmd:SessionHeader></soapenv:Header><soapenv:Body></soapenv:Body></soapenv:Envelope>';
                res.setBody(responseBody);
                res.setStatusCode(200);
            }
        }
        return res;
    }

}