public with sharing class LeadConverterClass {
    @InvocableMethod(label='Convert Lead' description='Convert a Lead to Account, Contact, and optionally Opportunity')
    public static List<LeadConversionResultWrapper> convertLead(List<LeadConversionWrapper> requestList) {
        List<Database.LeadConvert> leadConversions = new List<Database.LeadConvert>();
        List<LeadConversionResultWrapper> resultsList = new List<LeadConversionResultWrapper>();

        for (LeadConversionWrapper request : requestList) {
            LeadConversionResultWrapper resultWrapper = new LeadConversionResultWrapper();
            resultWrapper.success = false;

            try {
                // Query the Lead
                Lead lead = [SELECT Id FROM Lead WHERE Id = :request.leadId LIMIT 1];

                // Prepare the LeadConvert object
                Database.LeadConvert leadConvert = new Database.LeadConvert();
                leadConvert.setLeadId(lead.Id);
                leadConvert.setConvertedStatus(request.convertStatus);
                leadConvert.setDoNotCreateOpportunity(!request.createOpportunity);

                if (request.opportunityName != null) {
                    leadConvert.setOpportunityName(request.opportunityName);
                }

                leadConversions.add(leadConvert);

            } catch (QueryException e) {
                resultWrapper.errorMessage = 'Lead not found: ' + e.getMessage();
                resultsList.add(resultWrapper);
                continue;
            }

            // Convert Leads
            List<Database.LeadConvertResult> conversionResults = Database.convertLead(leadConversions, false);

            for (Database.LeadConvertResult conversionResult : conversionResults) {
                resultWrapper.success = conversionResult.isSuccess();
                resultWrapper.accountId = conversionResult.getAccountId();
                resultWrapper.contactId = conversionResult.getContactId();
                resultWrapper.opportunityId = conversionResult.getOpportunityId();

                if (!conversionResult.isSuccess()) {
                    resultWrapper.errorMessage = conversionResult.getErrors()[0].getMessage();
                }

                resultsList.add(resultWrapper);
            }
        }

        return resultsList;
    }

    public class LeadConversionWrapper {
        @InvocableVariable(required=true)
        public Id leadId;

        @InvocableVariable(required=true)
        public String convertStatus;

        @InvocableVariable
        public Boolean createOpportunity = true;

        @InvocableVariable
        public String opportunityName;
    }

    public class LeadConversionResultWrapper {
        @InvocableVariable
        public Boolean success;

        @InvocableVariable
        public Id accountId;

        @InvocableVariable
        public Id contactId;

        @InvocableVariable
        public Id opportunityId;

        @InvocableVariable
        public String errorMessage;
    }
}