@IsTest
private class DFJ_ProcessDocFabDocument_Test {
    static final String testValueOfExternalRecordUuid = '1234567890';
    @TestSetup
    static void setup() {

        Account accountRecord = new Account(
            Name = 'Test Account'
        );

        insert accountRecord;

        Lead leadRecord = new Lead(
            FirstName = 'Test',
            LastName = 'Lead'
        );

        insert leadRecord;

        Journal__c journalRecord1 = new Journal__c(
            External_record_uuid__c = testValueOfExternalRecordUuid,
            Account__c = accountRecord.Id
        );


        Journal__c journalRecord2 = new Journal__c(
                External_record_uuid__c = testValueOfExternalRecordUuid,
                Lead__c = leadRecord.Id
        );

        insert new List<SObject>{journalRecord1, journalRecord2};

        Doc_Fabricator_Setting__c docFabSetting = new Doc_Fabricator_Setting__c(
                URL__c = 'https://test.com/'
        );

        insert docFabSetting;
    }


    @IsTest
    static void testGetUrlWhenJournalRecordIdIsPassed(){
        Journal__c journalRecord = [
            SELECT Id FROM Journal__c LIMIT 1
        ]??null;


        if(journalRecord != null){
            Test.startTest();
            String url = DFJ_ProcessDocFabDocument_Apex.getUrl(journalRecord.Id, 'Journal__c');
            System.assertNotEquals(null, url);
            Test.stopTest();
        }


    }

    @IsTest
    static void testGetUrlWhenAccountRecordIdIsPassed(){
        Account accountRecord = [
                SELECT Id FROM Account LIMIT 1
        ]??null;


        if(accountRecord != null){
            Test.startTest();
            String url = DFJ_ProcessDocFabDocument_Apex.getUrl(accountRecord.Id, 'Account');
            System.assertNotEquals(null, url);
            Test.stopTest();
        }

    }

    @IsTest
    static void testGetUrlWhenLeadRecordIdIsPassed(){
        Lead leadRecord = [
                SELECT Id FROM Lead LIMIT 1
        ]??null;


        if(leadRecord != null){
            Test.startTest();
            String url = DFJ_ProcessDocFabDocument_Apex.getUrl(leadRecord.Id, 'Lead');
            System.assertNotEquals(null, url);
            Test.stopTest();
        }

    }

    @IsTest
    static void testWhenIncorrectRecordIdIsPassed(){
        Test.startTest();
        String url = DFJ_ProcessDocFabDocument_Apex.getUrl('incorrectId', 'Lead');
        System.assertEquals(null,url);
        Test.stopTest();
    }
}