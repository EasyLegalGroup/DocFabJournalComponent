@IsTest
private class McSmsSendQueue_Test {

    // ---------------------------
    // Mocks
    // ---------------------------

    /** Alpha mock: requires FromName to be present and returns 202 for all non-throw cases */
    private class MockAlphaRequiresFromName implements System.HttpCalloutMock {
        public System.HttpResponse respond(System.HttpRequest req) {
            String ep   = String.valueOf(req.getEndpoint());
            String body = req.getBody();

            if (req.getMethod() == 'POST' && ep.contains('/messaging/v1/sms/messages')) {
                System.assert(body != null && body.contains('"FromName":"FamJurist"'),
                    'Alpha send must include FromName="FamJurist"');
                System.HttpResponse ok = new System.HttpResponse();
                ok.setStatusCode(202);
                ok.setBody('{"requestId":"r1","responses":[{"messageKey":"mk"}]}');
                ok.setHeader('Content-Type','application/json; charset=UTF-8');
                ok.setStatus('OK');
                return ok;
            }
            System.HttpResponse miss = new System.HttpResponse();
            miss.setStatusCode(404);
            miss.setBody('{"message":"not found"}');
            miss.setHeader('Content-Type','application/json; charset=UTF-8');
            miss.setStatus('OK');
            return miss;
        }
    }

    /** Code mock: must NOT require FromName; returns 202 and ensures to is digits-only (no '+') */
    private class MockCodeNoFromName implements System.HttpCalloutMock {
        public System.HttpResponse respond(System.HttpRequest req) {
            String ep   = String.valueOf(req.getEndpoint());
            String body = req.getBody();

            if (req.getMethod() == 'POST' && ep.contains('/messaging/v1/sms/messages')) {
                System.assert(!(body != null && body.contains('"FromName"')),
                    'Code path should not send FromName');
                // crude check that "to" is digits-only (no plus)
                System.assert(body != null && body.contains('"to":"45'),
                    'Expect normalized digits-only DK number (should start with 45...)');

                System.HttpResponse ok = new System.HttpResponse();
                ok.setStatusCode(202);
                ok.setBody('{"requestId":"r1","responses":[{"messageKey":"mk"}]}');
                ok.setHeader('Content-Type','application/json; charset=UTF-8');
                ok.setStatus('OK');
                return ok;
            }
            System.HttpResponse miss = new System.HttpResponse();
            miss.setStatusCode(404);
            miss.setBody('{"message":"not found"}');
            miss.setHeader('Content-Type','application/json; charset=UTF-8');
            miss.setStatus('OK');
            return miss;
        }
    }

    /** Alpha mock that throws when a specific "to" is used to exercise EX path */
    private class MockAlphaSometimesThrows implements System.HttpCalloutMock {
        public System.HttpResponse respond(System.HttpRequest req) {
            String ep   = String.valueOf(req.getEndpoint());
            String body = req.getBody();
            if (req.getMethod() == 'POST' && ep.contains('/messaging/v1/sms/messages')) {
                System.assert(body != null && body.contains('"FromName":"FamJurist"'),
                    'Alpha send must include FromName="FamJurist"');
                // Throw for this target (digits-only)
                if (body != null && body.contains('"to":"4599999999"')) {
                    throw new System.CalloutException('Simulated failure');
                }
                System.HttpResponse ok = new System.HttpResponse();
                ok.setStatusCode(202);
                ok.setBody('{"requestId":"r1","responses":[{"messageKey":"mk"}]}');
                ok.setHeader('Content-Type','application/json; charset=UTF-8');
                ok.setStatus('OK');
                return ok;
            }
            System.HttpResponse miss = new System.HttpResponse();
            miss.setStatusCode(404);
            miss.setBody('{"message":"not found"}');
            miss.setHeader('Content-Type','application/json; charset=UTF-8');
            miss.setStatus('OK');
            return miss;
        }
    }

    /** SE code mock: must NOT require FromName; expect digits-only starting with 46 */
    private class MockSECodeNoFromName implements System.HttpCalloutMock {
        public System.HttpResponse respond(System.HttpRequest req) {
            String ep   = String.valueOf(req.getEndpoint());
            String body = req.getBody();

            if (req.getMethod() == 'POST' && ep.contains('/messaging/v1/sms/messages')) {
                System.assert(!(body != null && body.contains('"FromName"')),
                    'Code path should not send FromName (SE).');
                System.assert(body != null && body.contains('"to":"46'),
                    'Expect normalized digits-only SE number (should start with 46...)');

                System.HttpResponse ok = new System.HttpResponse();
                ok.setStatusCode(202);
                ok.setBody('{"requestId":"r1","responses":[{"messageKey":"mk"}]}');
                ok.setHeader('Content-Type','application/json; charset=UTF-8');
                ok.setStatus('OK');
                return ok;
            }
            System.HttpResponse miss = new System.HttpResponse();
            miss.setStatusCode(404);
            miss.setBody('{"message":"not found"}');
            miss.setHeader('Content-Type','application/json; charset=UTF-8');
            miss.setStatus('OK');
            return miss;
        }
    }

    // ---------------------------
    // Helpers
    // ---------------------------

    /** Minimal routing rules (DK + optional SE) */
    private static void setTestRouting(Boolean includeSE) {
        List<McSmsRouting__mdt> rules = new List<McSmsRouting__mdt>{
            new McSmsRouting__mdt(
                CountryPrefix__c = '+45',
                CurrencyIsoCode__c = 'DKK',
                DefinitionKey__c = 'SMS_TRX_DK_CODE',
                AlphaDefinitionKey__c = 'SMS_TRX_DK_ALPHA',
                IsDefault__c = true
            )
        };
        if (includeSE == true) {
            rules.add(
                new McSmsRouting__mdt(
                    CountryPrefix__c = '+46',
                    CurrencyIsoCode__c = 'SEK',
                    DefinitionKey__c = 'SMS_TRX_SE_CODE',
                    AlphaDefinitionKey__c = 'SMS_TRX_SE_ALPHA',
                    IsDefault__c = false
                )
            );
        }
        McSmsRouting.TEST_RULES = rules;
    }

    // ---------------------------
    // Tests
    // ---------------------------

    @IsTest
    static void test_alpha_sends_and_updates() {
        Test.setMock(System.HttpCalloutMock.class, new MockAlphaRequiresFromName());
        setTestRouting(true);

        Lead l = new Lead(LastName='L', Company='C', FirstName='Mads', MobilePhone='+4522334455', Provider_id__c='smsq_test_1');
        insert l;

        // alpha → FromName must be injected by queue class
        SMS__c s1 = new SMS__c(
            Direction__c='Outgoing', Type__c='Automated', Status__c='Pending',
            To_Number__c='+4542455150',
            Record_ID__c=l.Id,
            Is_Synced_to_Marketing_Cloud__c=false,
            Send_Large_Messages__c=false,
            Send_From_Alphanumeric_Sender_ID__c=true,
            CurrencyIsoCode='DKK'
        );
        SMS__c s2 = new SMS__c(
            Direction__c='Outgoing', Type__c='Automated', Status__c='Pending',
            To_Number__c='+4522334455',
            Record_ID__c=l.Id,
            Is_Synced_to_Marketing_Cloud__c=false,
            Send_Large_Messages__c=false,
            Send_From_Alphanumeric_Sender_ID__c=true,
            CurrencyIsoCode='DKK'
        );
        insert new List<SMS__c>{ s1, s2 };

        Test.startTest();
        System.enqueueJob(new McSmsSendQueue(new Set<Id>{ s1.Id, s2.Id }));
        Test.stopTest();

        Map<Id, SMS__c> afterMap = new Map<Id, SMS__c>([
            SELECT Id, Is_Synced_to_Marketing_Cloud__c, Status_Code__c, Response_Body__c, External_ID__c
            FROM SMS__c WHERE Id IN :new Set<Id>{s1.Id, s2.Id}
        ]);

        System.assertEquals('202', afterMap.get(s1.Id).Status_Code__c, 's1 should reflect 202');
        System.assert(afterMap.get(s1.Id).Response_Body__c != null && afterMap.get(s1.Id).Response_Body__c.contains('messageKey'));
        System.assertEquals(String.valueOf(s1.Id), afterMap.get(s1.Id).External_ID__c);
        System.assertEquals(true, afterMap.get(s1.Id).Is_Synced_to_Marketing_Cloud__c);

        System.assertEquals('202', afterMap.get(s2.Id).Status_Code__c, 's2 should reflect 202');
        System.assert(afterMap.get(s2.Id).Response_Body__c != null && afterMap.get(s2.Id).Response_Body__c.contains('messageKey'));
        System.assertEquals(String.valueOf(s2.Id), afterMap.get(s2.Id).External_ID__c);
        System.assertEquals(true, afterMap.get(s2.Id).Is_Synced_to_Marketing_Cloud__c);

        McSmsRouting.TEST_RULES = null;
    }

    @IsTest
    static void test_code_send_no_fromname_ok() {
        Test.setMock(System.HttpCalloutMock.class, new MockCodeNoFromName());
        setTestRouting(false); // DK only

        Lead l = new Lead(LastName='CodeTest', Company='C', Provider_id__c='smsq_code_1');
        insert l;

        // code path (flag = false) → must NOT include FromName
        SMS__c s = new SMS__c(
            Direction__c='Outgoing', Type__c='Automated', Status__c='Pending',
            To_Number__c='+4542455150',
            Record_ID__c=l.Id,
            Is_Synced_to_Marketing_Cloud__c=false,
            Send_Large_Messages__c=false,
            Send_From_Alphanumeric_Sender_ID__c=false, // code
            CurrencyIsoCode='DKK'
        );
        insert s;

        Test.startTest();
        System.enqueueJob(new McSmsSendQueue(new Set<Id>{ s.Id }));
        Test.stopTest();

        s = [SELECT Id, Status_Code__c, Is_Synced_to_Marketing_Cloud__c, Response_Body__c, External_ID__c FROM SMS__c WHERE Id = :s.Id];
        System.assertEquals('202', s.Status_Code__c);
        System.assertEquals(true, s.Is_Synced_to_Marketing_Cloud__c);
        System.assert(s.Response_Body__c != null && s.Response_Body__c.contains('messageKey'));
        System.assertEquals(String.valueOf(s.Id), s.External_ID__c);
        McSmsRouting.TEST_RULES = null;
    }

    @IsTest
    static void test_exception_path_sets_EX_and_success_for_other_rows() {
        Test.setMock(System.HttpCalloutMock.class, new MockAlphaSometimesThrows());
        setTestRouting(false);

        Lead l = new Lead(LastName='ExTest', Company='C', Provider_id__c='smsq_ex_1');
        insert l;

        SMS__c ok = new SMS__c(
            Direction__c='Outgoing', Type__c='Automated', Status__c='Pending',
            To_Number__c='+4542455150',
            Record_ID__c=l.Id,
            Is_Synced_to_Marketing_Cloud__c=false,
            Send_Large_Messages__c=false,
            Send_From_Alphanumeric_Sender_ID__c=true, // alpha
            CurrencyIsoCode='DKK'
        );
        SMS__c boom = new SMS__c(
            Direction__c='Outgoing', Type__c='Automated', Status__c='Pending',
            To_Number__c='+4599999999', // → normalized "4599999999" which mock throws on
            Record_ID__c=l.Id,
            Is_Synced_to_Marketing_Cloud__c=false,
            Send_Large_Messages__c=false,
            Send_From_Alphanumeric_Sender_ID__c=true, // alpha
            CurrencyIsoCode='DKK'
        );
        insert new List<SMS__c>{ ok, boom };

        Test.startTest();
        System.enqueueJob(new McSmsSendQueue(new Set<Id>{ ok.Id, boom.Id }));
        Test.stopTest();

        Map<Id, SMS__c> afterMap = new Map<Id, SMS__c>([
            SELECT Id, Status_Code__c, Response_Body__c, Is_Synced_to_Marketing_Cloud__c
            FROM SMS__c WHERE Id IN :new Set<Id>{ ok.Id, boom.Id }
        ]);

        System.assertEquals('202', afterMap.get(ok.Id).Status_Code__c, 'ok row should succeed');
        System.assertEquals(true,  afterMap.get(ok.Id).Is_Synced_to_Marketing_Cloud__c);

        System.assertEquals('EX',  afterMap.get(boom.Id).Status_Code__c, 'boom row should mark EX');
        System.assertEquals(false, afterMap.get(boom.Id).Is_Synced_to_Marketing_Cloud__c);
        System.assert(afterMap.get(boom.Id).Response_Body__c != null &&
                      afterMap.get(boom.Id).Response_Body__c.contains('CalloutException'),
                      'EX body should include exception detail');

        McSmsRouting.TEST_RULES = null;
    }

    @IsTest
    static void test_related_record_present_vr_friendly() {
        // NOTE: Your org has a VR requiring To_Number__c. So we CANNOT test the true
        // "fallback when To_Number__c is blank" scenario here. This VR-friendly test
        // keeps To_Number__c populated and just ensures normal success.
        Test.setMock(System.HttpCalloutMock.class, new MockAlphaRequiresFromName());
        setTestRouting(false);

        Contact c = new Contact(LastName='Doe', FirstName='Jane', MobilePhone='+4511122233');
        insert c;

        SMS__c s = new SMS__c(
            Direction__c='Outgoing', Type__c='Automated', Status__c='Pending',
            To_Number__c='+4511122233',   // keep populated for VR
            Record_ID__c=c.Id,
            Is_Synced_to_Marketing_Cloud__c=false,
            Send_Large_Messages__c=false,
            Send_From_Alphanumeric_Sender_ID__c=true, // alpha
            CurrencyIsoCode='DKK'
        );
        insert s;

        Test.startTest();
        System.enqueueJob(new McSmsSendQueue(new Set<Id>{ s.Id }));
        Test.stopTest();

        s = [SELECT Id, Status_Code__c, Response_Body__c, Is_Synced_to_Marketing_Cloud__c FROM SMS__c WHERE Id = :s.Id];
        System.assertEquals('202', s.Status_Code__c);
        System.assertEquals(true,  s.Is_Synced_to_Marketing_Cloud__c);
        System.assert(s.Response_Body__c != null && s.Response_Body__c.contains('messageKey'));
        McSmsRouting.TEST_RULES = null;
    }

    @IsTest
    static void test_batching_no_reenqueue_loop() {
        // Use the code-path mock to avoid FromName assertion complexity here
        Test.setMock(System.HttpCalloutMock.class, new MockCodeNoFromName());
        setTestRouting(false);

        Lead l = new Lead(LastName='BatchTest', Company='C', Provider_id__c='smsq_batch_1');
        insert l;

        // Set a small batch size but create EXACTLY that many rows so no remainder exists.
        McSmsSendQueue.MAX_OVERRIDE = 3;

        List<SMS__c> rows = new List<SMS__c>();
        for (Integer i = 0; i < 3; i++) {
            rows.add(new SMS__c(
                Direction__c='Outgoing', Type__c='Automated', Status__c='Pending',
                To_Number__c='+45424551' + String.valueOf(50 + i),
                Record_ID__c=l.Id,
                Is_Synced_to_Marketing_Cloud__c=false,
                Send_Large_Messages__c=false,
                Send_From_Alphanumeric_Sender_ID__c=false, // code path
                CurrencyIsoCode='DKK'
            ));
        }
        insert rows;

        Set<Id> ids = new Set<Id>();
        for (SMS__c s : rows) ids.add(s.Id);

        Test.startTest();
        System.enqueueJob(new McSmsSendQueue(ids));
        Test.stopTest();

        List<SMS__c> after = [
            SELECT Id, Status_Code__c, Is_Synced_to_Marketing_Cloud__c, Response_Body__c
            FROM SMS__c WHERE Id IN :ids ORDER BY Id
        ];
        System.assertEquals(3, after.size(), 'sanity');
        for (SMS__c s : after) {
            System.assertEquals('202', s.Status_Code__c, 'Every row should succeed');
            System.assertEquals(true, s.Is_Synced_to_Marketing_Cloud__c);
            System.assert(s.Response_Body__c != null && s.Response_Body__c.contains('messageKey'));
        }

        // Clean up
        McSmsSendQueue.MAX_OVERRIDE = null;
        McSmsRouting.TEST_RULES = null;
    }

    // ---------------------------
    // NEW: SE local normalization test
    // ---------------------------
    @IsTest
    static void test_se_local_normalizes_and_sends_code() {
        Test.setMock(System.HttpCalloutMock.class, new MockSECodeNoFromName());
        setTestRouting(true); // include SE rules

        Lead l = new Lead(LastName='SETest', Company='C', Provider_id__c='smsq_se_1');
        insert l;

        // Local Swedish format: 070...
        SMS__c s = new SMS__c(
            Direction__c='Outgoing', Type__c='Automated', Status__c='Pending',
            To_Number__c='0701234567',
            Record_ID__c=l.Id,
            Is_Synced_to_Marketing_Cloud__c=false,
            Send_Large_Messages__c=false,
            Send_From_Alphanumeric_Sender_ID__c=false, // numeric sender (code path)
            CurrencyIsoCode='SEK'
        );
        insert s;

        Test.startTest();
        System.enqueueJob(new McSmsSendQueue(new Set<Id>{ s.Id }));
        Test.stopTest();

        s = [SELECT Id, Status_Code__c, Is_Synced_to_Marketing_Cloud__c, Response_Body__c, External_ID__c
             FROM SMS__c WHERE Id = :s.Id];

        System.assertEquals('202', s.Status_Code__c);
        System.assertEquals(true,  s.Is_Synced_to_Marketing_Cloud__c);
        System.assert(s.Response_Body__c != null && s.Response_Body__c.contains('messageKey'));
        System.assertEquals(String.valueOf(s.Id), s.External_ID__c);

        McSmsRouting.TEST_RULES = null;
    }
}