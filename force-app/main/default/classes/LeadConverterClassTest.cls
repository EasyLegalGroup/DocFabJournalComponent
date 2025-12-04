@isTest
public class LeadConverterClassTest {

    @isTest
    static void testConvertLead() {
        // Create a test Lead inline instead of using TestSetup
        Lead testLead = new Lead(
            FirstName = 'Test',
            LastName = 'Lead',
            Company = 'Test Company',
            Status = 'New',
            Provider_Id__c = 'test-provider-456',
            OwnerId = UserInfo.getUserId()
        );
        insert testLead;
        
        // Query a valid convert status for the Lead - use Qualified
        LeadStatus convertStatus = [SELECT MasterLabel FROM LeadStatus WHERE IsConverted = true AND MasterLabel = 'Qualified' LIMIT 1];

        // Prepare input for the method
        LeadConverterClass.LeadConversionWrapper request = new LeadConverterClass.LeadConversionWrapper();
        request.leadId = testLead.Id;
        request.convertStatus = convertStatus.MasterLabel;
        request.createOpportunity = true;
        request.opportunityName = 'Test Opportunity';

        List<LeadConverterClass.LeadConversionWrapper> requests = new List<LeadConverterClass.LeadConversionWrapper>();
        requests.add(request);

        // Call the method
        Test.startTest();
        List<LeadConverterClass.LeadConversionResultWrapper> results = LeadConverterClass.convertLead(requests);
        Test.stopTest();

        // Validate the results
        System.assertEquals(1, results.size(), 'Should have one result');
        System.assert(results[0].success, 'Lead conversion should be successful');
        System.assertNotEquals(null, results[0].accountId, 'AccountId should not be null');
        System.assertNotEquals(null, results[0].contactId, 'ContactId should not be null');
        System.assertNotEquals(null, results[0].opportunityId, 'OpportunityId should not be null');
        System.assertEquals(null, results[0].errorMessage, 'There should be no error message');
    }

    @isTest
    static void testConvertLeadFailure() {
        // Create a dummy Lead ID that does not exist
        Id dummyLeadId = '00Q000000000000000';

        // Query a valid convert status for the Lead - use Qualified
        LeadStatus convertStatus = [SELECT MasterLabel FROM LeadStatus WHERE IsConverted = true AND MasterLabel = 'Qualified' LIMIT 1];

        // Prepare input for the method
        LeadConverterClass.LeadConversionWrapper request = new LeadConverterClass.LeadConversionWrapper();
        request.leadId = dummyLeadId;
        request.convertStatus = convertStatus.MasterLabel;
        request.createOpportunity = false;

        List<LeadConverterClass.LeadConversionWrapper> requests = new List<LeadConverterClass.LeadConversionWrapper>();
        requests.add(request);

        // Call the method
        Test.startTest();
        List<LeadConverterClass.LeadConversionResultWrapper> results = LeadConverterClass.convertLead(requests);
        Test.stopTest();

        // Validate the results
        System.assertEquals(1, results.size(), 'Should have one result');
        System.assert(!results[0].success, 'Lead conversion should fail');
        System.assertEquals(null, results[0].accountId, 'AccountId should be null');
        System.assertEquals(null, results[0].contactId, 'ContactId should be null');
        System.assertEquals(null, results[0].opportunityId, 'OpportunityId should be null');
        System.assertNotEquals(null, results[0].errorMessage, 'There should be an error message');
    }
}