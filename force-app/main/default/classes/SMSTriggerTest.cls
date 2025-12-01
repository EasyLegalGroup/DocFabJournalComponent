@IsTest
private class SMSTriggerTest {

    @IsTest
    static void testInsertAndUpdate_minimal() {
        // Create Lead for Record_ID__c validation
        Lead testLead = new Lead(LastName='SMSTriggerLead', Company='TestCo', Provider_id__c='sms_trigger_1');
        insert testLead;

        // Build Unicode safely from hex (ASCII-only source)
        String EN_DASH = EncodingUtil.convertFromHex('E28093').toString(); // U+2013
        String EURO    = EncodingUtil.convertFromHex('E282AC').toString(); // U+20AC

        // Insert: GSM, GSM_7_Extended, UCS-2  (include required fields)
        List<SMS__c> toIns = new List<SMS__c>();
        toIns.add(new SMS__c(
            Message__c = 'Hello world',
            To_Number__c = '+4542455150',
            Record_ID__c = testLead.Id,
            Direction__c = 'Outgoing',
            Type__c = 'Custom'
        ));
        toIns.add(new SMS__c(
            Message__c = 'Curly { and euro ' + EURO,
            To_Number__c = '+4542455150',
            Record_ID__c = testLead.Id,
            Direction__c = 'Outgoing',
            Type__c = 'Custom'
        ));
        toIns.add(new SMS__c(
            Message__c = 'Here is an en dash ' + EN_DASH,
            To_Number__c = '+4542455150',
            Record_ID__c = testLead.Id,
            Direction__c = 'Outgoing',
            Type__c = 'Custom'
        ));
        insert toIns;

        // Verify encodings populated (single-line SOQL)
        List<SMS__c> fetched = [SELECT Id, Encoding__c, Non_Standard_Characters__c FROM SMS__c WHERE Id IN :toIns];
        Map<Id, SMS__c> fm = new Map<Id, SMS__c>(fetched);

        System.assertEquals('GSM_7',          fm.get(toIns[0].Id).Encoding__c);
        System.assertEquals('GSM_7_Extended', fm.get(toIns[1].Id).Encoding__c);
        System.assertEquals('UCS-2',          fm.get(toIns[2].Id).Encoding__c);
        System.assertNotEquals(null,          fm.get(toIns[2].Id).Non_Standard_Characters__c);

        // Update: 2nd => UCS-2, 3rd cleared (include required fields to satisfy validation)
        List<SMS__c> upd = new List<SMS__c>();
        upd.add(new SMS__c(
            Id = toIns[1].Id,
            Message__c = 'Updated to UCS2 ' + EN_DASH,
            To_Number__c = '+4542455150',
            Direction__c = 'Outgoing',
            Type__c = 'Custom'
        ));
        upd.add(new SMS__c(
            Id = toIns[2].Id,
            Message__c = null,
            To_Number__c = '+4542455150',
            Direction__c = 'Outgoing',
            Type__c = 'Custom'
        ));
        update upd;

        SMS__c after2 = [SELECT Encoding__c FROM SMS__c WHERE Id = :toIns[1].Id];
        SMS__c after3 = [SELECT Encoding__c, Segments__c FROM SMS__c WHERE Id = :toIns[2].Id];

        System.assertEquals('UCS-2', after2.Encoding__c);
        System.assertEquals(null,    after3.Encoding__c);
        System.assertEquals(0,       after3.Segments__c);
    }

    @IsTest
    static void testBulk_simple() {
        // Create Lead for Record_ID__c validation
        Lead testLead = new Lead(LastName='SMSBulkLead', Company='TestCo', Provider_id__c='sms_bulk_1');
        insert testLead;

        String EN_DASH = EncodingUtil.convertFromHex('E28093').toString(); // U+2013

        List<SMS__c> bulkSms = new List<SMS__c>();
        for (Integer i = 0; i < 100; i++) {
            Boolean forceUnicode = (Math.mod(i, 10) == 0); // every 10th -> UCS-2
            String body = forceUnicode ? ('UCS2 ' + EN_DASH + ' #' + i) : ('Bulk ' + i + ' with {extended}');
            bulkSms.add(new SMS__c(
                Message__c = body,
                To_Number__c = '+4542455150',
                Record_ID__c = testLead.Id,
                Direction__c = 'Outgoing',
                Type__c = 'Custom'
            ));
        }
        insert bulkSms;

        List<SMS__c> got = [SELECT Message__c, Encoding__c, Segments__c FROM SMS__c WHERE Id IN :bulkSms];
        Integer unicodeSeen = 0, extendedOrGsmSeen = 0;
        for (SMS__c r : got) {
            if (r.Message__c != null && r.Message__c.startsWith('UCS2 ')) {
                System.assertEquals('UCS-2', r.Encoding__c);
                unicodeSeen++;
            } else if (r.Message__c != null && r.Message__c.contains('{extended}')) {
                System.assertEquals(true, r.Encoding__c == 'GSM_7' || r.Encoding__c == 'GSM_7_Extended');
                extendedOrGsmSeen++;
            }
            System.assert(r.Segments__c >= 0);
        }
        System.assert(unicodeSeen > 0);
        System.assert(extendedOrGsmSeen > 0);
    }
}