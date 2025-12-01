@IsTest
private class McSmsFlowEnqueue_Test {
    private class Mock implements System.HttpCalloutMock {
        public System.HttpResponse respond(System.HttpRequest req) {
            System.HttpResponse res = new System.HttpResponse();
            res.setHeader('Content-Type','application/json; charset=UTF-8');

            if (req.getMethod() == 'POST' && String.valueOf(req.getEndpoint()).contains('/messaging/v1/sms/messages')) {
                res.setStatusCode(202);
                res.setBody('{"requestId":"r1","responses":[{"messageKey":"mk"}]}');
            } else {
                res.setStatusCode(404);
                res.setBody('{"message":"not found"}');
            }
            res.setStatus('OK');
            return res;
        }
    }

    @IsTest
    static void test_invocable_enqueues_and_updates() {
        Test.setMock(System.HttpCalloutMock.class, new Mock());

        // Inject routing rules so the queue doesn't hit EX path due to missing CMD data
        McSmsRouting.TEST_RULES = new List<McSmsRouting__mdt>{
            new McSmsRouting__mdt(
                CountryPrefix__c='+45', CurrencyIsoCode__c='DKK',
                DefinitionKey__c='SMS_TRX_DK', AlphaDefinitionKey__c='SMS_TRX_DK', IsDefault__c=true
            )
        };

        // Create a Lead for Record_ID__c
        Lead testLead = new Lead(LastName='TestSMS', Company='TestCo', Provider_id__c='sms_test_1');
        insert testLead;

        SMS__c s = new SMS__c(
            Direction__c='Outgoing', Type__c='Automated', Status__c='Pending',
            To_Number__c='+4542455150',
            Record_ID__c=testLead.Id,
            Is_Synced_to_Marketing_Cloud__c=false,
            Send_Large_Messages__c=false,
            Send_From_Alphanumeric_Sender_ID__c=false,
            CurrencyIsoCode='DKK'
        );
        insert s;

        McSmsFlowEnqueue.Input in1 = new McSmsFlowEnqueue.Input();
        in1.recordId = s.Id;

        Test.startTest();
        McSmsFlowEnqueue.enqueue(new List<McSmsFlowEnqueue.Input>{ in1 });
        Test.stopTest();

        s = [SELECT Is_Synced_to_Marketing_Cloud__c, Status_Code__c, External_ID__c, Response_Body__c
             FROM SMS__c WHERE Id = :s.Id];

        System.assertEquals('202', s.Status_Code__c, 'Should reflect 202 Accepted');
        System.assertEquals(String.valueOf(s.Id), s.External_ID__c, 'External Id should be set to record Id');
        System.assert(s.Response_Body__c != null && s.Response_Body__c.contains('messageKey'));

        // tidy
        McSmsRouting.TEST_RULES = null;
    }
}