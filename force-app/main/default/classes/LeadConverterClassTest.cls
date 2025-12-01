@isTest
public class LeadConverterClassTest {
    
    @TestSetup
    static void setup() {
        // Create a test Lead
        Lead testLead = new Lead(
            FirstName = 'Test',
            LastName = 'Lead',
            Company = 'Test Company',
            Status = 'New',
            Provider_id__c = 'lcc_test_1'
        );
        insert testLead;
    }

    @isTest
    static void testConvertLead() {
        // Step 1: Query a valid convert status for the Lead
        LeadStatus convertStatus = [SELECT MasterLabel FROM LeadStatus WHERE IsConverted = true LIMIT 1];

        // Step 2: Get the Lead record created in @TestSetup
        Lead testLead = [SELECT Id FROM Lead WHERE Provider_id__c = 'lcc_test_1' LIMIT 1];

        // Step 3: Prepare input for the method
        LeadConverterClass.LeadConversionWrapper request = new LeadConverterClass.LeadConversionWrapper();
        request.leadId = testLead.Id;
        request.convertStatus = convertStatus.MasterLabel;
        request.createOpportunity = true;
        request.opportunityName = 'Test Opportunity';

        List<LeadConverterClass.LeadConversionWrapper> requests = new List<LeadConverterClass.LeadConversionWrapper>();
        requests.add(request);

        // Step 4: Call the method
        Test.startTest();
        List<LeadConverterClass.LeadConversionResultWrapper> results = LeadConverterClass.convertLead(requests);
        Test.stopTest();

        // Step 5: Validate the results
        System.assertEquals(1, results.size(), 'Should have one result');
        System.assert(results[0].success, 'Lead conversion should be successful');
        System.assertNotEquals(null, results[0].accountId, 'AccountId should not be null');
        System.assertNotEquals(null, results[0].contactId, 'ContactId should not be null');
        System.assertNotEquals(null, results[0].opportunityId, 'OpportunityId should not be null');
        System.assertEquals(null, results[0].errorMessage, 'There should be no error message');
    }

    @isTest
    static void testConvertLeadFailure() {
        // Step 1: Create a dummy Lead ID that does not exist
        Id dummyLeadId = '00Q000000000000000';

        // Step 2: Query a valid convert status for the Lead
        LeadStatus convertStatus = [SELECT MasterLabel FROM LeadStatus WHERE IsConverted = true LIMIT 1];

        // Step 3: Prepare input for the method
        LeadConverterClass.LeadConversionWrapper request = new LeadConverterClass.LeadConversionWrapper();
        request.leadId = dummyLeadId;
        request.convertStatus = convertStatus.MasterLabel;
        request.createOpportunity = false;

        List<LeadConverterClass.LeadConversionWrapper> requests = new List<LeadConverterClass.LeadConversionWrapper>();
        requests.add(request);

        // Step 4: Call the method
        Test.startTest();
        List<LeadConverterClass.LeadConversionResultWrapper> results = LeadConverterClass.convertLead(requests);
        Test.stopTest();

        // Step 5: Validate the results
        System.assertEquals(1, results.size(), 'Should have one result');
        System.assert(!results[0].success, 'Lead conversion should fail');
        System.assertEquals(null, results[0].accountId, 'AccountId should be null');
        System.assertEquals(null, results[0].contactId, 'ContactId should be null');
        System.assertEquals(null, results[0].opportunityId, 'OpportunityId should be null');
        System.assertNotEquals(null, results[0].errorMessage, 'There should be an error message');
    }
}