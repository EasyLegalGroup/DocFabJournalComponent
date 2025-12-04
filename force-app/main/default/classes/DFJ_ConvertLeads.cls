/**
 * Created by Shubham Sharma on 14-03-2019.
 */

// Converts a lead as a step in a Visual Workflow process
global class DFJ_ConvertLeads implements Process.Plugin {
    // This method runs when the step is reached in a Flow
    global Process.PluginResult invoke(Process.PluginRequest request) {
        // set up variables to store input parameters from the Flow
        String leadID = (String) request.inputParameters.get('LeadID');
        String contactID = (String) request.inputParameters.get('ContactID');
        String accountID = (String) request.inputParameters.get('AccountID');
        String convertedStatus = (String) request.inputParameters.get('ConvertedStatus');
        Boolean overWriteLeadSource = (Boolean) request.inputParameters.get('OverwriteLeadSource');
        Boolean createOpportunity = (Boolean) request.inputParameters.get('CreateOpportunity');
        String opportunityName = (String) request.inputParameters.get('ContactID');
        Boolean sendEmailToOwner = (Boolean) request.inputParameters.get('SendEmailToOwner');
        String paymentMethod = (String) request.inputParameters.get('paymentMethod');
        String paymentType = (String) request.inputParameters.get('paymentType');
        String PaymentOrderNumber = (String) request.inputParameters.get('PaymentOrderNumber');
        //Boolean isMember = (Boolean) request.inputParameters.get('isMember');

        // Set the default handling for booleans
        if (overWriteLeadSource == null) overWriteLeadSource = false;
        if (createOpportunity == null) createOpportunity = false;
        if (sendEmailToOwner == null) sendEmailToOwner = false;

        // convert the lead by passing to a helper method
        Map<String,Object> result = new Map<String,Object>();
        result = convertLead(leadID, contactID, accountID, convertedStatus, overWriteLeadSource, createOpportunity, opportunityName, sendEmailToOwner, paymentMethod,paymentType, PaymentOrderNumber);

        return new Process.PluginResult(result);
    }

    // This method describes this plugin, as well as its inputs and outputs to the Cloud Designer
    // NOTE: Implementing this method is what makes this class appear in the designer
    global Process.PluginDescribeResult describe() {
        // Set up plugin metadata
        Process.PluginDescribeResult result = new Process.PluginDescribeResult();
        result.description = 'The LeadConvert Flow Plug-in converts a lead into an account and contact, as well as (optionally) an opportunity.';
        result.tag = 'Lead Management';

        // create a list that stores both mandatory and optional *input* parameters from a Flow
        // NOTE: Only primitive types (STRING, NUMBER, etc) are supported at this time.
        // Collections are not currently supported
        result.inputParameters = new List<Process.PluginDescribeResult.InputParameter>{
                // Lead ID (mandatory)
                new Process.PluginDescribeResult.InputParameter('LeadID',
                        Process.PluginDescribeResult.ParameterType.STRING, true),
               // isMember (mandatory)
                // new Process.PluginDescribeResult.InputParameter('isMember',
                // Process.PluginDescribeResult.ParameterType.BOOLEAN, true),
                // Account Id (optional)
                new Process.PluginDescribeResult.InputParameter('AccountID',
                        Process.PluginDescribeResult.ParameterType.STRING, false),
                // Contact ID (optional)
                new Process.PluginDescribeResult.InputParameter('ContactID',
                        Process.PluginDescribeResult.ParameterType.STRING, false),
                // Status to use once converted
                new Process.PluginDescribeResult.InputParameter('ConvertedStatus',
                        Process.PluginDescribeResult.ParameterType.STRING, true),
                new Process.PluginDescribeResult.InputParameter('OpportunityName',
                        Process.PluginDescribeResult.ParameterType.STRING, false),
                new Process.PluginDescribeResult.InputParameter('OverwriteLeadSource',
                        Process.PluginDescribeResult.ParameterType.BOOLEAN, false),
                new Process.PluginDescribeResult.InputParameter('CreateOpportunity',
                        Process.PluginDescribeResult.ParameterType.BOOLEAN, false),
                new Process.PluginDescribeResult.InputParameter('SendEmailToOwner',
                        Process.PluginDescribeResult.ParameterType.BOOLEAN, false),
                new Process.PluginDescribeResult.InputParameter('paymentMethod',
                        Process.PluginDescribeResult.ParameterType.STRING, false),
                new Process.PluginDescribeResult.InputParameter('paymentType',
                        Process.PluginDescribeResult.ParameterType.STRING, false),
                new Process.PluginDescribeResult.InputParameter('PaymentOrderNumber',
                        Process.PluginDescribeResult.ParameterType.STRING, false)
        };

        // Create a list that stores *output* parameters sent *to* your flow.
        result.outputParameters = new List<Process.PluginDescribeResult.OutputParameter>{
                // Account ID of the converted lead
                new Process.PluginDescribeResult.OutputParameter('AccountID',
                        Process.PluginDescribeResult.ParameterType.STRING),
                // Contact ID of the converted lead
                new Process.PluginDescribeResult.OutputParameter('ContactID',
                        Process.PluginDescribeResult.ParameterType.STRING),
                // Opportunity ID of the converted lead
                new Process.PluginDescribeResult.OutputParameter('OpportunityID',
                        Process.PluginDescribeResult.ParameterType.STRING)
        };

        return result;
    }

    /**
     * Implementation of the LeadConvert plugin
     * Converts a given lead with several options:
     * leadID - The ID of the lead to convert
     * contactID -
     * accountID - ID of the Account to attach the converted Lead/Oppty/Contact to.
     * convertedStatus -
     * overWriteLeadSource -
     * createOpportunity - true if you want to create a new Opportunity upon conversion
     * opportunityName - Name of the new Opportunity.
     * sendEmailtoOwner - true if you are changing owners upon conversion and want to send an email to the new owner of the Oppty.
     *
     * returns: a Map with the following output:
     * AccountID - ID of the Account created or attached to upon conversion.
     * ContactID - ID of the contact created or attached to upon conversion.
     * OpportunityID - ID of the opportunity created upon conversion.
     */
    public Map<String,String> convertLead (
            String leadID,
            String contactID,
            String accountID,
            String convertedStatus,
            Boolean overWriteLeadSource,
            Boolean createOpportunity,
            String opportunityName,
            Boolean sendEmailToOwner,
            String paymentMethod,
            String paymentType,
            String PaymentOrderNumber
            
    ) {                        
        String journalId = '';
        Map<String,String> result = new Map<String,String>();

        if (leadId == null) throw new ConvertLeadPluginException('Lead Id cannot be null');

        // check for multiple leads with the same ID
        // Added the Related_Event_ID__c for DFJ-101 changes 
        Lead[] leads = [Select Id, FirstName,Related_Event_ID__c, LastName,Name, Company,Market_Unit__c,Phone,Email,Fixed_discount_Type__c From Lead where Id = :leadID];
        if (leads.size() > 0) {

            Lead leadInstance = leads[0];
            leadInstance.Company = '';
            leadInstance.OwnerId = UserInfo.getUserId();
            update leadInstance;
            // perform the lead conversion
            Database.LeadConvert lc = new Database.LeadConvert();
            lc.setLeadId(leadID);
            lc.setOverwriteLeadSource(overWriteLeadSource);
            lc.setDoNotCreateOpportunity(!createOpportunity);
            // Use passed convertedStatus parameter, fallback to querying for valid status
            if (String.isBlank(convertedStatus)) {
                LeadStatus defaultStatus = [SELECT MasterLabel FROM LeadStatus WHERE IsConverted = true LIMIT 1];
                convertedStatus = defaultStatus.MasterLabel;
            }
            lc.setConvertedStatus(convertedStatus);
            if (sendEmailToOwner != null) lc.setSendNotificationEmail(sendEmailToOwner);
            if (accountId != null && accountId.length() > 0) lc.setAccountId(accountId);
            if (contactId != null && contactId.length() > 0) lc.setContactId(contactId);
            Database.LeadConvertResult lcr = Database.convertLead(lc, true);
            // changes for ticket DIN-226 : Create memberships from lead directly.
            // Start
            List<Journal__c> journalRecord = new List<Journal__c>(); //Changes DIN-377
			//Changes DFJ-61
           /* List<Membership__c> memberShipInstanceList = new List<Membership__c>();
            memberShipInstanceList = [SELECT Id,Account__c,Is_customer__c,OwnerId,Name,Phone__c, Email__c,Lead__c,CPR__c From Membership__c WHERE Lead__c=:leadID LIMIT 1];
            //End*/
            // End
           // Membership__c memberShipInstance = new Membership__c();
           //System.debug('result-->'+result);
            if (lcr.isSuccess()) {
              
                //Chnages DIN-377
                //Start
                //End
                // End
                result.put('AccountID', lcr.getAccountId());
                String AccountIdLead = lcr.getAccountId();
                Boolean hasOrderId;

                List<LeadProducts__c> leadProductsList = new List<LeadProducts__c>();
                leadProductsList = [SELECT Id,Discount__c,Item_Price__c,Lead__c,Name,PricebookEntry_Id__c,Pricebook_Id__c,Product_Id__c,Product_Name__c,Quantity__c,Partner_provision_value__c,Partner_Sales_Value__c,Provision_Base__c FROM LeadProducts__c WHERE (PricebookEntry_Id__c != null AND Pricebook_Id__c != null) AND Lead__c =: leads[0].Id LIMIT 10000];
                if(leadProductsList != null && !leadProductsList.isEmpty()) {
                    //DFJ-128 Changes Added converted Account on Subscription Object
                    List<Subscriptions__c> subscriptionList = [SELECT Id, Account__c FROM Subscriptions__c WHERE Lead__c =:leads[0].Id LIMIT 1];
                    if(!subscriptionList.isEmpty()){
                        subscriptionList[0].Account__c = lcr.accountid;
                        update subscriptionList;
                    }					
                    
                    //End
                    List<Payments__c> paymentRecordList = new List<Payments__c>();
                    /*String paymentCondition = 'Lead__c = \''+ leads[0].Id +'\'';
                    List<String> paymentFieldList = new List<String>{'CurrencyISOCode','Id','Name','Status__c','Type__c','Lead__c','Order__c','Invoice_created__c','Amount__c'};
                    paymentRecordList = PS_PaymentUtility.fetchRecordsDynamically(paymentCondition, paymentFieldList, 'Payments__c');*/
                    paymentRecordList = [SELECT Id,Related_Event_ID__c,Amount__c, CurrencyISOCode, Invoice_created__c, Lead__c, Order__c,Refunded_Amount__c, Status__c,Type__c, Fixed_discount_Type__c,Name FROM Payments__c Where Lead__c =: leads[0].Id ORDER BY CreatedDate DESC LIMIT 10000];

                    Order orderRecord = new Order();
                    orderRecord.AccountId = AccountIdLead;
                    orderRecord.Pricebook2Id = leadProductsList[0].Pricebook_Id__c;
                    orderRecord.Status = 'Draft';
                    orderRecord.Payment_method__c = paymentMethod;
                    orderRecord.Payment_type__c = paymentType;
                    orderRecord.Payment_order_number__c = PaymentOrderNumber;
                    orderRecord.EffectiveDate = Date.today();
                    orderRecord.Market_Unit__c = leads[0].Market_Unit__c;
                    //DFJ-101
                    orderRecord.Related_Event_ID__c = leads[0].Related_Event_ID__c;
                    //End
                    orderRecord.Lead__c = leadID;
                    orderRecord.currencyIsoCode = leads[0].Market_Unit__c == 'FA_SE' || leads[0].Market_Unit__c == 'Testamente_SV' ? 'SEK' : 'DKK';
                    // Discount changes
                    orderRecord.Fixed_discount_Type__c = leads[0].Fixed_discount_Type__c;
                    orderRecord.Refund_Value__c = paymentRecordList.isEmpty() ? 0 : paymentRecordList[0].Refunded_Amount__c;
                   
                    insert orderRecord;

                    if (!paymentRecordList.isEmpty()) {
                        for (Payments__c payment : paymentRecordList) {
                            payment.Order__c = orderRecord.Id;
                            //DFJ-101 starts
                            payment.Related_Event_ID__c = leads[0].Related_Event_ID__c;
                            //End
                        }
                        update paymentRecordList;
                    }

                  
                    List<OrderItem> orderItemList = new List<OrderItem>();
                    for(LeadProducts__c leadProduct : leadProductsList){
                        OrderItem orderLineItem = new OrderItem();
                        orderLineItem.OrderId = orderRecord.Id;
                        orderLineItem.PricebookEntryId = leadProduct.PricebookEntry_Id__c;
                        orderLineItem.Product2Id = leadProduct.Product_Id__c;
                        orderLineItem.Discount__c = leadProduct.Discount__c;
                        orderLineItem.Quantity = leadProduct.Quantity__c;
                        orderLineItem.UnitPrice = leadProduct.Item_Price__c;
                        orderLineItem.Partner_provision_value__c = leadProduct.Partner_Provision_Value__c;
                        orderLineItem.Partner_sales_value__c = leadProduct.Partner_Sales_Value__c;
                        orderLineItem.Provision_base__c = leadProduct.Provision_Base__c;
                        
                        orderItemList.add(orderLineItem);
                    }
                 
                    
                    if(orderItemList != null && !orderItemList.isEmpty()){
                        insert orderItemList;
                    }
                    hasOrderId = false;

                    List<Journal__c> listOfJournal = new List<Journal__c>();
                    //Changes DFJ-61 Added DocFab_Record_Model_ID__c in the 
                    listOfJournal = [SELECT Id,Related_Event_ID__c, Name,Lead__c,DocFab_Record_Model_ID__c,Account__c,Market_Unit__c,Responsible_Lawyer__c,OwnerId,External_record_uuid__c From Journal__c Where Lead__c =: lcr.leadid];
                    if(listOfJournal != null){
                        List<Lead> listOfLead = new List<Lead>();
                        listOfLead = [Select Name,Related_Event_ID__c,Address,Phone,Street,PostalCode,City,State,Country,Email,FirstName,LastName,Children_over_18__c,Has_children__c,Civil_status__c,Children_type__c,Market_Unit__c From Lead Where Id =: lcr.leadid];
                        //Checking for the value of the field Civil Status
                        if(listOfLead[0].Civil_status__c == 'Gift'){
                            listOfLead[0].Civil_status__c = 'Married';
                        }else if(listOfLead[0].Civil_status__c == 'Enlig'){
                            listOfLead[0].Civil_status__c = 'Single';
                        }else if(listOfLead[0].Civil_status__c == 'Samlevende'){
                            listOfLead[0].Civil_status__c = 'Cohabiting';
                        }

                        // Checking for the value of the field Type of Children
                        if(listOfLead[0].Children_type__c == 'Fælles børn'){
                            listOfLead[0].Children_type__c = 'Common';
                        }else if(listOfLead[0].Children_type__c == 'Sammenbragte børn'){
                            listOfLead[0].Children_type__c = '	Blended';
                        }else if(listOfLead[0].Children_type__c == 'Begge dele'){
                            listOfLead[0].Children_type__c = '';
                        }

                        //If the lead has some journal associated with it then updating the "Account" field with the account id of the journal.
                        if(!listOfJournal.isEmpty()){

                            listOfJournal[0].Account__c = lcr.accountid;
                            listOfJournal[0].Order__c = orderRecord.Id;
                            listOfJournal[0].Market_Unit__c = listOfLead[0].Market_Unit__c;
                            //DFJ-101 changes
                            listOfJournal[0].Related_Event_ID__c = listOfLead[0].Related_Event_ID__c;
                            //End
                            update listOfJournal;
                            journalRecord.addAll(listOfJournal); //Changes DIN-377
                            //Chnages DIN-377
                            //Start
                          
                            //End
                            //Changes Starts DFJ-77
                            journalId =  listOfJournal[0].Id;
                            //End
                        }else{
                            //If the lead has no journal associated with it then creating a new journal and inserting the account id and lead id into it.
                            Journal__c journalInstance = new Journal__c();
                            journalInstance.Account__c = lcr.accountid;
                            journalInstance.Lead__c = lcr.leadid;
                            journalInstance.Civil_Status__c = listOfLead[0].Civil_status__c;
                            journalInstance.Has_Children__c = listOfLead[0].Has_children__c;
                            journalInstance.All_children_over_18__c = listOfLead[0].Children_over_18__c;
                            journalInstance.Children_type__c = listOfLead[0].Children_type__c;
                            journalInstance.Order__c = orderRecord.Id;
                            journalInstance.Market_Unit__c = listOfLead[0].Market_Unit__c;
                           
                            insert journalInstance;
                            listOfJournal.add(journalInstance);
                            journalRecord.addAll(listOfJournal); //Changes DIN-377
                            //Changes Starts DFJ-77
                            journalId =  journalInstance.Id;
                            //End
                       
                        }
                        
                        //Update campaign on Order DFJ-101
                        List<Campaign> getCampaign = [SELECT Id, Related_Event_ID__c FROM Campaign WHERE Related_Event_ID__c=:leads[0].Related_Event_ID__c AND Related_Event_ID__c!= null LIMIT 1];
                        //End
                        //Changes DFJ-77 Starts
                        Order updateOrderwithJournal = new Order();
                        updateOrderwithJournal.Id = orderRecord.Id;
                        updateOrderwithJournal.Journal__c = journalId;
                        // Add Campaign on Order DFJ-101
                        if(!getCampaign.isEmpty()){
                        updateOrderwithJournal.Campaign__c = !String.isBlank(leads[0].Related_Event_ID__c) ? getCampaign[0].Id : null;
                        }
                        // End
                        update updateOrderwithJournal;
                        //End
                        List<Person__c> listOfPerson = new List<Person__c>();
                        listOfPerson = [Select Id,Name,Journal__c From Person__c WHERE  Journal__c IN: listOfJournal AND Type__c = 'Spouse 1'];
                        if(listOfPerson.isEmpty()){

                            String addressString = '';
                            addressString+=listOfLead[0].Street == null ? '' : listOfLead[0].Street;
                            addressString+=listOfLead[0].PostalCode == null ? '' : ','+' '+listOfLead[0].PostalCode;
                            addressString+=listOfLead[0].City == null ? '' : ','+' '+listOfLead[0].City;
                            addressString+=listOfLead[0].State == null ? '' : ','+' '+listOfLead[0].State;
                            addressString+=listOfLead[0].Country == null ? '' : ','+' '+listOfLead[0].Country;

                            Person__c personInstance = new Person__c();
                            personInstance.First_Name__c = listOfLead[0].FirstName;
                            personInstance.Last_Name__c = listOfLead[0].LastName;
                            personInstance.Address__c = addressString;
                            personInstance.Zip_Code__c = String.valueOf(listOfLead[0].PostalCode);
                            personInstance.City__c = String.valueOf(listOfLead[0].City);
                            personInstance.Phone__c = listOfLead[0].Phone;
                            personInstance.Email__c = listOfLead[0].Email;
                            personInstance.Type__c = 'Spouse 1';
                            personInstance.Journal__c = listOfJournal[0].Id;
                            personInstance.Market_Unit__c = listOfJournal[0].Market_Unit__c;
                            insert personInstance;



                        }
                    }
                }else{
                    hasOrderId = true;
                }
                //New Changes
                //Converted lead Id
                //Getting the journals related to the lead
                List<Lead> listOfLead = new List<Lead>();
                if(hasOrderId){
                    List<Journal__c> listOfJournal = new List<Journal__c>();
                    listOfJournal = [SELECT Id,Name,Lead__c,Account__c,Responsible_Lawyer__c,OwnerId,External_record_uuid__c From Journal__c Where Lead__c =: lcr.leadid];
                    if(listOfJournal != null){
                        
                        listOfLead = [Select Related_Event_ID__c,Name,Address,Phone,Street,PostalCode,City,State,Country,Email,FirstName,LastName,Children_over_18__c,Has_children__c,Civil_status__c,Children_type__c,Market_Unit__c From Lead Where Id =: lcr.leadid];
                        //Checking for the value of the field Civil Status
                        if(listOfLead[0].Civil_status__c == 'Gift'){
                            listOfLead[0].Civil_status__c = 'Married';
                        }else if(listOfLead[0].Civil_status__c == 'Enlig'){
                            listOfLead[0].Civil_status__c = 'Single';
                        }else if(listOfLead[0].Civil_status__c == 'Samlevende'){
                            listOfLead[0].Civil_status__c = 'Cohabiting';
                        }

                        // Checking for the value of the field Type of Children
                        if(listOfLead[0].Children_type__c == 'Fælles børn'){
                            listOfLead[0].Children_type__c = 'Common';
                        }else if(listOfLead[0].Children_type__c == 'Sammenbragte børn'){
                            listOfLead[0].Children_type__c = '	Blended';
                        }else if(listOfLead[0].Children_type__c == 'Begge dele'){
                            listOfLead[0].Children_type__c = '';
                        }

                        //If the lead has some journal associated with it then updating the "Account" field with the account id of the journal.
                        if(!listOfJournal.isEmpty()){
                            listOfJournal[0].Account__c = lcr.accountid;
                            listOfJournal[0].Children_type__c = listOfLead[0].Children_type__c;
                            listOfJournal[0].All_children_over_18__c = listOfLead[0].Children_over_18__c;
                            listOfJournal[0].Has_Children__c = listOfLead[0].Has_children__c;
                            listOfJournal[0].Civil_Status__c = listOfLead[0].Civil_status__c;
                            listOfJournal[0].Market_Unit__c = listOfLead[0].Market_Unit__c;
                            //DFJ-101
                            listOfJournal[0].Related_Event_ID__c = listOfLead[0].Related_Event_ID__c;
                            //End

                            update listOfJournal;
                            journalRecord.addAll(listOfJournal); //Changes DIN-377
                        }else{
                            //If the lead has no journal associated with it then creating a new journal and inserting the account id and lead id into it.
                            Journal__c journalInstance = new Journal__c();
                            journalInstance.Account__c = lcr.accountid;
                            journalInstance.Lead__c = lcr.leadid;
                            journalInstance.Civil_Status__c = listOfLead[0].Civil_status__c;
                            journalInstance.Has_Children__c = listOfLead[0].Has_children__c;
                            journalInstance.All_children_over_18__c = listOfLead[0].Children_over_18__c;
                            journalInstance.Children_type__c = listOfLead[0].Children_type__c;
                            journalInstance.Market_Unit__c = listOfLead[0].Market_Unit__c;
                            //DFJ-101 Starts
                            journalInstance.Related_Event_ID__c = listOfLead[0].Related_Event_ID__c;
                            //End
                         
                            insert journalInstance;
                            listOfJournal.add(journalInstance);
                            journalRecord.addAll(listOfJournal); //Changes DIN-377
                           
                        }
                        List<Person__c> listOfPerson = new List<Person__c>();
                        listOfPerson = [Select Id,Name,Journal__c From Person__c WHERE  Journal__c IN: listOfJournal AND Type__c = 'Spouse 1'];
                        if(listOfPerson.isEmpty()){

                            String addressString = '';
                            addressString+=listOfLead[0].Street == null ? '' : listOfLead[0].Street;
                            addressString+=listOfLead[0].PostalCode == null ? '' : ','+' '+listOfLead[0].PostalCode;
                            addressString+=listOfLead[0].City == null ? '' : ','+' '+listOfLead[0].City;
                            addressString+=listOfLead[0].State == null ? '' : ','+' '+listOfLead[0].State;
                            addressString+=listOfLead[0].Country == null ? '' : ','+' '+listOfLead[0].Country;

                            Person__c personInstance = new Person__c();
                            personInstance.First_Name__c = listOfLead[0].FirstName;
                            personInstance.Last_Name__c = listOfLead[0].LastName;
                            personInstance.Address__c = addressString;
                            personInstance.Zip_Code__c = String.valueOf(listOfLead[0].PostalCode);
                            personInstance.City__c = String.valueOf(listOfLead[0].City);
                            personInstance.Phone__c = listOfLead[0].Phone;
                            personInstance.Email__c = listOfLead[0].Email;
                            personInstance.Type__c = 'Spouse 1';
                            personInstance.Journal__c = listOfJournal[0].Id;
                            personInstance.Market_Unit__c = listOfJournal[0].Market_Unit__c;
                            insert personInstance;



                        }
                    }
                }
                if(!journalRecord.isEmpty()){
                    DFJ_MembershipController queueableInstance = new DFJ_MembershipController(lcr.leadid);
        			System.enqueueJob(queueableInstance); 
                   //  DFJ_MembershipController.createMembershipOnLeadConvert(journalRecord,lcr.leadid,lcr.accountid);
                }
                //Chnages for DIN-377 :- Create memberships from docfab record data.
                //Start
              
                // Changes for DIN-226 : Create memberships from lead directly.
                // Start
                // Start
             
                /*
                List<df_journal_dk__c> listOfJournalDK = new List<df_journal_dk__c>();
                if(!String.isBlank(journalRecord[0].External_record_uuid__c )){
                   
                    listOfJournalDK = [SELECT Id, 
                                            Journal__c,
                                            uuid__c,
                                            person_1_cpr__c,
                                            person_2_cpr__c,
                                            person_1_first_name__c,
                                            person_1_last_name__c,
                                            person_2_first_name__c,
                                            person_2_last_name__c,
                                            person_1_email__c,	
                                            person_1_phone__c,	
                                            person_2_email__c,	
                                            person_2_phone__c,
                                            nsker_medlemskab_person_1__c,
                                            nsker_medlemskab_person_2__c 
                                            FROM df_journal_dk__c
                                            WHERE
                                            uuid__c =: journalRecord[0].External_record_uuid__c 
                                            LIMIT 1 ];  

                    if(!listOfJournalDK.isEmpty()){
                   
                        if(listOfJournalDK[0].nsker_medlemskab_person_1__c && memberShipInstanceList.isEmpty()){
                            Membership__c memberShipInstance = new Membership__c();
                            memberShipInstance.Account__c = lcr.accountid;
                            memberShipInstance.Lead__c = lcr.leadid;
                            memberShipInstance.Sign_up_Date__c = System.Today();
                            memberShipInstance.Name = listOfJournalDK[0].person_1_first_name__c+' '+listOfJournalDK[0].person_1_last_name__c;
                            memberShipInstance.Last_Name__c = listOfJournalDK[0].person_1_last_name__c;
                            memberShipInstance.First_Name__c = listOfJournalDK[0].person_1_first_name__c;
                            memberShipInstance.Phone__c = listOfJournalDK[0].person_1_phone__c;
                            memberShipInstance.Email__c = listOfJournalDK[0].person_1_email__c;
                            memberShipInstance.CPR__c = (!String.isBlank(listOfJournalDK[0].person_1_cpr__c) ? listOfJournalDK[0].person_1_cpr__c : '') ;
                            memberShipInstance.Is_customer__c = true;   
                            try{                                
                                if(memberShipInstanceList.isEmpty()){  //Changes DIN-377 Remove condition of IsMember
                                    memberShipInstance.OwnerId = String.isNotBlank(journalRecord[0].OwnerId) ? journalRecord[0].OwnerId : null;
                                }
                            } catch(Exception ex){
                                DFJ_ErrorController.addErrorLogs(journalRecord[0].Id, 'Setting responsible lawyer.', ex.getMessage(), 'Error', 'DFJ_ConvertLeads apex class method.',String.valueOf(ex.getLineNumber()));
                            } 
                            memberShipInstanceList.add(memberShipInstance);
                        }else if(listOfJournalDK[0].nsker_medlemskab_person_1__c && !memberShipInstanceList.isEmpty()){
                            memberShipInstanceList[0].OwnerId = leads[0].OwnerId;
                            memberShipInstanceList[0].Account__c = lcr.accountid;
                            memberShipInstanceList[0].Is_customer__c = true;
                            memberShipInstanceList[0].CPR__c = (!String.isBlank(listOfJournalDK[0].person_1_cpr__c) ? listOfJournalDK[0].person_1_cpr__c : '');
                            memberShipInstanceList[0].Phone__c = listOfJournalDK[0].person_1_phone__c;
                            memberShipInstanceList[0].Email__c = listOfJournalDK[0].person_1_email__c;
                        }
                    
                        if(listOfJournalDK[0].nsker_medlemskab_person_2__c && (!String.isBlank(listOfJournalDK[0].person_2_first_name__c) || !String.isBlank(listOfJournalDK[0].person_2_last_name__c))){
                            Membership__c membershipInstanceForPerson2 = new Membership__c();
                            membershipInstanceForPerson2.Account__c = lcr.accountid;
                            membershipInstanceForPerson2.Lead__c = lcr.leadid;
                            membershipInstanceForPerson2.Sign_up_Date__c = System.Today();
                            membershipInstanceForPerson2.Name = listOfJournalDK[0].person_2_first_name__c+' '+listOfJournalDK[0].person_2_last_name__c;
                            membershipInstanceForPerson2.Last_Name__c = listOfJournalDK[0].person_2_last_name__c;
                            membershipInstanceForPerson2.First_Name__c = listOfJournalDK[0].person_2_first_name__c;
                            membershipInstanceForPerson2.Phone__c = listOfJournalDK[0].person_2_phone__c;
                            membershipInstanceForPerson2.Email__c = listOfJournalDK[0].person_2_email__c;
                            membershipInstanceForPerson2.CPR__c = listOfJournalDK[0].person_2_cpr__c;
                            membershipInstanceForPerson2.Is_customer__c = true;
                            try{                                
                                if(!memberShipInstanceList.isEmpty()){  //Changes DIN-377 Remove condition of IsMember
                                    membershipInstanceForPerson2.OwnerId = String.isNotBlank(journalRecord[0].OwnerId) ? journalRecord[0].OwnerId : null;
                                }
                            } catch(Exception ex){
                                DFJ_ErrorController.addErrorLogs(journalRecord[0].Id, 'Setting responsible lawyer.', ex.getMessage(), 'Error', 'DFJ_ConvertLeads apex class method.',String.valueOf(ex.getLineNumber()));
                            }
                            memberShipInstanceList.add(membershipInstanceForPerson2);
                        }  
                    }
                }
                
                // End
                if(!memberShipInstanceList.isEmpty()){
                    upsert memberShipInstanceList;
                    
                }
               */
                
                  //End
                // Changes for DIN-232 : Update account id on cost ledger when lead is converted.
                // Description : Setting account Id to cost ledger record if exist.
                // Start
                List<Cost_Ledger__c> relatedCostledgerList = new List<Cost_Ledger__c>();
                relatedCostledgerList = [SELECT Id,Name,Lead__c,Account__c FROM Cost_Ledger__c WHERE Lead__c =:leads[0].Id LIMIT 10000];
                for (Cost_Ledger__c costLedgerLoop : relatedCostledgerList) {
                    costLedgerLoop.Account__c = lcr.accountid;
                }
                if (!relatedCostledgerList.isEmpty()) {
                    update relatedCostledgerList;
                }
                // END

                //============================================ Changes done by Shubham =====================================
                //DFJ-101 Changes
               /* if(!String.isBlank(leads[0].Related_Event_ID__c)){
                    Account accInst = new Account();
					accInst.Id = lcr.accountid;
                	accInst.Related_Event_ID__c = leads[0].Related_Event_ID__c;
                	update accInst;
                	System.Debug('accInst==>'+accInst);
                }*/
                
                    //================ Changes end here ==================================================================

            } else {
                String error = lcr.getErrors()[0].getMessage();
                throw new ConvertLeadPluginException(error);
            }
        } else {
            throw new ConvertLeadPluginException('No leads found with Id : "' + leadId + '"');
        }
        return result;
    }

    // Utility exception class
    class ConvertLeadPluginException extends Exception {}

    
}