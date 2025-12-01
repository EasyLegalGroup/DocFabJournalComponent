@IsTest
private class McSmsStatusPoller_Test {

    // Mock MC responses for three cases: Delivered, Queued, Failed
    private class Mock implements System.HttpCalloutMock {
        public System.HttpResponse respond(System.HttpRequest req) {
            System.HttpResponse res = new System.HttpResponse();
            res.setHeader('Content-Type','application/json; charset=UTF-8');
            String ep = String.valueOf(req.getEndpoint());

            if (ep.endsWith('/messaging/v1/sms/messages/mk-delivered')) {
                res.setStatusCode(200);
                res.setBody('{"eventCategoryType":"TransactionalSendEvents.SMSDelivered"}');
            } else if (ep.endsWith('/messaging/v1/sms/messages/mk-queued')) {
                res.setStatusCode(200);
                res.setBody('{"eventCategoryType":"TransactionalSendEvents.SMSQueued"}');
            } else if (ep.endsWith('/messaging/v1/sms/messages/mk-failed')) {
                res.setStatusCode(200);
                res.setBody('{"eventCategoryType":"TransactionalSendEvents.SMSFailed"}');
            } else {
                res.setStatusCode(404);
                res.setBody('{"message":"not found"}');
            }
            res.setStatus('OK');
            return res;
        }
    }

    @IsTest
    static void test_poller_updates_status() {
        Test.setMock(System.HttpCalloutMock.class, new Mock());

        // Create Lead for Record_ID__c validation
        Lead l = new Lead(LastName='PollerTest', Company='C', Provider_id__c='sms_poller_1');
        insert l;

        // Seed three Outgoing rows the poller will pick up
        SMS__c d = new SMS__c(
            Direction__c='Outgoing', Type__c='Automated', Status__c='Pending',
            Is_Synced_to_Marketing_Cloud__c=true, External_ID__c='mk-delivered',
            To_Number__c='+4512345678',
            Record_ID__c=l.Id,
            Send_Large_Messages__c=false, Send_From_Alphanumeric_Sender_ID__c=false, CurrencyIsoCode='DKK'
        );
        SMS__c q = new SMS__c(
            Direction__c='Outgoing', Type__c='Automated', Status__c='Pending',
            Is_Synced_to_Marketing_Cloud__c=true, External_ID__c='mk-queued',
            To_Number__c='+4512345679',
            Record_ID__c=l.Id,
            Send_Large_Messages__c=false, Send_From_Alphanumeric_Sender_ID__c=false, CurrencyIsoCode='DKK'
        );
        SMS__c f = new SMS__c(
            Direction__c='Outgoing', Type__c='Automated', Status__c='Pending',
            Is_Synced_to_Marketing_Cloud__c=true, External_ID__c='mk-failed',
            To_Number__c='+4512345680',
            Record_ID__c=l.Id,
            Send_Large_Messages__c=false, Send_From_Alphanumeric_Sender_ID__c=false, CurrencyIsoCode='DKK'
        );
        insert new List<SMS__c>{ d, q, f };

        Test.startTest();
        // Call the poller directly (more reliable than scheduling in tests)
        new McSmsStatusPoller().execute(null);
        Test.stopTest();

        Map<Id, SMS__c> afterMap = new Map<Id, SMS__c>([
            SELECT Id, Status__c, Status_Code__c, Sent_Received_Time__c
            FROM SMS__c WHERE Id IN :new Set<Id>{ d.Id, q.Id, f.Id }
        ]);

        System.assertEquals('Delivered',   afterMap.get(d.Id).Status__c, 'Delivered event should map to Delivered');
        System.assertEquals('Queued',      afterMap.get(q.Id).Status__c, 'Queued event should map to Queued');
        System.assertEquals('Failed',      afterMap.get(f.Id).Status__c, 'Failed event should map to Failed');
        System.assertEquals('200',         afterMap.get(d.Id).Status_Code__c);
        System.assertNotEquals(null,       afterMap.get(d.Id).Sent_Received_Time__c);
    }
}