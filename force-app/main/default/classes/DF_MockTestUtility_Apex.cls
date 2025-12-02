@isTest
/*
   * @ Version : 1.0
   * @ Created Date : 2021-07-18
   * @Description : This class is use to generate test responses for the test class.
*/
global with sharing class DF_MockTestUtility_Apex implements HttpCalloutMock{
    global HTTPResponse respond(HTTPRequest req) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Accept', 'application/json');
        response.setHeader('Content-Type', 'application/json');

        if (String.valueOf(req.getHeader('Authorization')).subStringAfter(' ') == 'M0mOH7wOd5PZkGsDTH8qcOwPBOK77I' && req.getEndpoint().equals('https://admin.docfabricator.com/api/users/?email='+UserInfo.getUserEmail())) {
            response.setStatusCode(200);
            String body = '[{\"id\":2,\"email\":\"test@test.com\",\"first_name\":\"test\",\"last_name\":\"test\"}]';
            response.setBody(body);
             return response;
        }else if(String.valueOf(req.getHeader('Authorization')).subStringAfter(' ') == 'M0mOH7wOd5PZkGsDTH8qcOwPBOK77J' && req.getEndpoint().equals('https://admin.docfabricator.com/api/users/?email='+UserInfo.getUserEmail())){
            response.setStatusCode(200);
            String body = '['+
             ']';
            response.setBody(body);
             return response;
        }else if(String.valueOf(req.getHeader('Authorization')).subStringAfter(' ') == 'M0mOH7wOd5PZkGsDTH8qcOwPBOK7K5' && req.getEndpoint().equals('https://admin.docfabricator.com/api/users/?email='+UserInfo.getUserEmail())){
            response.setStatusCode(500);
            String body = '{'+
            '"messageString": "Staus code 500 Server Error"'+
            '}';
            response.setBody(body);
            return response;
        }else if(String.valueOf(req.getHeader('Authorization')).subStringAfter(' ') == 'M0mOH7wOd5PZkGsDTH8qcOwPBOK77I' && req.getEndpoint().equals('https://admin.docfabricator.com/api/create-record')){
            response.setStatusCode(200);
            String body = '{'+
                '"uuid": "1"'+
                '}';
            response.setBody(body);
            return response;
        }

        return null;
    }
}