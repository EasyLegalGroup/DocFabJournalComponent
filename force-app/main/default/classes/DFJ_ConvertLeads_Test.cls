/**
 * Created by Shubham Sharma on 14-03-2019.
 */

@isTest
private with sharing class DFJ_ConvertLeads_Test {

    // Helper method to get DFJ_DK RecordTypeId
    private static Id getDfjDkRecordTypeId() {
        return Schema.SObjectType.Lead.getRecordTypeInfosByDeveloperName().get('DFJ_DK').getRecordTypeId();
    }

    static testMethod void basicTest() {

        // Create dummy lead
        Lead testLead = new Lead(Company='Din Familiejurist ApS',FirstName='John',LastName='Doe',Provider_id__c = '1324',OwnerId=UserInfo.getUserId(),RecordTypeId=getDfjDkRecordTypeId(),Market_Unit__c='DFJ_DK');
        insert testLead;

        LeadStatus convertStatus = [Select Id, MasterLabel from LeadStatus where IsConverted=true limit 1];

        // Create dummy conversion
        DFJ_ConvertLeads aLeadPlugin = new DFJ_ConvertLeads();
        Map<String,Object> inputParams = new Map<String,Object>();
        Map<String,Object> outputParams = new Map<String,Object>();

        inputParams.put('LeadID',testLead.ID);
        // inputParams.put('isMember',true);
        inputParams.put('ConvertedStatus',convertStatus.MasterLabel);

        Process.PluginRequest request = new Process.PluginRequest(inputParams);
        Process.PluginResult result;
        result = aLeadPlugin.invoke(request);

        Lead aLead = [select name, id, isConverted from Lead where id = :testLead.ID];
        System.Assert(aLead.isConverted);

    }

    /*
     * This test is to test the convert Lead with the Account ID specified
     */
    static testMethod void basicTestwithAccount() {

        // Create dummy lead
        Lead testLead = new Lead(Company='Din Familiejurist ApS',FirstName='John',LastName='Doe',Provider_id__c = '1324',OwnerId=UserInfo.getUserId(),RecordTypeId=getDfjDkRecordTypeId(),Market_Unit__c='DFJ_DK');
        insert testLead;

        Payments__c testPayment = new Payments__c(Amount__c = 10,Lead__c = testLead.Id);
        insert testPayment;
        
        Product2 productInstance =new Product2();
        productInstance.Name='test';
        productInstance.productCode='1234';
        productInstance.isActive = true;
        productInstance.For_Promotion__c = true;
        productInstance.Product_Identifier__c = 'PT1';
        insert productInstance;
        
        Id pb2 = Test.getStandardPricebookId();
        PriceBook2 pricebookInstance=new PriceBook2();
        pricebookInstance.Id = pb2;
        update pricebookInstance;
        
        PricebookEntry pricebookEntryInstance = new PricebookEntry();
        pricebookEntryInstance.Pricebook2Id = pricebookInstance.Id;
        pricebookEntryInstance.Product2Id = productInstance.Id;
        pricebookEntryInstance.UnitPrice = 1020;
        pricebookEntryInstance.IsActive = true;
        insert pricebookEntryInstance;
        
        LeadProducts__c lpInstance = new LeadProducts__c();
        lpInstance.Name = 'Testlp';
        lpInstance.Product_Id__c = productInstance.Id;
        lpInstance.Pricebook_Id__c = pb2;
        lpInstance.PricebookEntry_Id__c = pricebookEntryInstance.Id;
        lpInstance.Discount__c = 0;
        lpInstance.Lead__c = testLead.Id;
        lpInstance.Item_Price__c = 10.00;
        lpInstance.Quantity__c = 1;
        lpInstance.Partner_provision_value__c = 1;
        lpInstance.Partner_sales_value__c = 1;
        lpInstance.Provision_base__c = 1;
        insert lpInstance;

        Account testAccount = new Account(name='Test Account');
        insert testAccount;

        Journal__c journalInstance = new Journal__c();
        journalInstance.External_record_uuid__c = 'f89e4d06-237b-4237-96c3-d66cca481cf0';
        journalInstance.Lead__c = testLead.Id;
        journalInstance.Account__c = testAccount.id;
        insert journalInstance;

        df_journal_dk__c journalDK = new df_journal_dk__c();
        journalDK.Journal__c = journalInstance.Id;
        journalDK.nsker_medlemskab_person_1__c = true;
        journalDK.nsker_medlemskab_person_2__c = true;
        journalDK.uuid__c = 'f89e4d06-237b-4237-96c3-d66cca481cf0';
        journalDK.person_1_cpr__c = 'XXXXX-345678';
        journalDK.person_2_cpr__c = 'xxxx-6789';
        journalDK.person_1_first_name__c = 'Test2';
        journalDK.person_1_last_name__c = 'Person1';
        journalDK.person_2_first_name__c = 'Test';
        journalDK.person_1_email__c = 'testemail@gmail.com';
        journalDk.person_2_email__c = 'testemail@gmail.com';
        insert journalDK;

        df_54_prrende_begge_personer__c dfj = new df_54_prrende_begge_personer__c();
        dfj.journal_dk__c = journalDK.Id;
        dfj.hvem_er_denne_person_prrende_for__c = 'prrende_for_person1';
        dfj.efternavn_prrende__c = 'Erik';
        dfj.fornavn_prrende__c = 'Jacsbon';
        dfj.telefonnummer_prrende__c = '34567890';
        dfj.email_prrende__c = 'erikJacsbon@gmail.com';
        insert dfj;

        // System.debug('ACCOUNT BEFORE' + testAccount.ID);

        LeadStatus convertStatus = [Select Id, MasterLabel from LeadStatus where IsConverted=true limit 1];

        // Create dummy conversion
        DFJ_ConvertLeads aLeadPlugin = new DFJ_ConvertLeads();
        Map<String,Object> inputParams = new Map<String,Object>();
        Map<String,Object> outputParams = new Map<String,Object>();

        inputParams.put('LeadID',testLead.ID);
        inputParams.put('AccountID',testAccount.ID);
        // inputParams.put('isMember',true);
        inputParams.put('ConvertedStatus',convertStatus.MasterLabel);

        Process.PluginRequest request = new Process.PluginRequest(inputParams);
        Process.PluginResult result;
        result = aLeadPlugin.invoke(request);

        Lead aLead = [select name, id, isConverted, convertedAccountID from Lead where id = :testLead.ID];
        System.Assert(aLead.isConverted);
        //System.debug('ACCOUNT AFTER' + aLead.convertedAccountID);
        System.AssertEquals(testAccount.ID, aLead.convertedAccountID);
    }

/*
  * This test is to test the convert Lead with the Account ID specified
  */
    static testMethod void basicTestwithAccounts() {

        // Create dummy lead
        Lead testLead = new Lead(Company='Din Familiejurist ApS',FirstName='John',LastName='Doe',Provider_id__c = '1324',OwnerId=UserInfo.getUserId(),RecordTypeId=getDfjDkRecordTypeId(),Market_Unit__c='DFJ_DK');
        insert testLead;

        Account testAccount1 = new Account(name='Test Lead');
        insert testAccount1;
        Account testAccount2 = new Account(name='Test Lead');
        insert testAccount2;

        // System.debug('ACCOUNT BEFORE' + testAccount.ID);

        LeadStatus convertStatus = [Select Id, MasterLabel from LeadStatus where IsConverted=true limit 1];

        // Create dummy conversion
        DFJ_ConvertLeads aLeadPlugin = new DFJ_ConvertLeads();
        Map<String,Object> inputParams = new Map<String,Object>();
        Map<String,Object> outputParams = new Map<String,Object>();

        inputParams.put('LeadID',testLead.ID);
        // inputParams.put('isMember',true);
        inputParams.put('ConvertedStatus',convertStatus.MasterLabel);

        Process.PluginRequest request = new Process.PluginRequest(inputParams);
        Process.PluginResult result;
        result = aLeadPlugin.invoke(request);

        Lead aLead = [select name, id, isConverted, convertedAccountID from Lead where id = :testLead.ID];
        System.Assert(aLead.isConverted);
    }


    /*
     * -ve Test
     */
    static testMethod void errorTest() {

        // Create dummy lead
        //Lead testLead = new Lead(Company='Test Lead',FirstName='John',LastName='Doe');
        LeadStatus convertStatus = [Select Id, MasterLabel from LeadStatus where IsConverted=true limit 1];

        // Create dummy conversion
        DFJ_ConvertLeads aLeadPlugin = new DFJ_ConvertLeads();
        Map<String,Object> inputParams = new Map<String,Object>();
        Map<String,Object> outputParams = new Map<String,Object>();
        inputParams.put('LeadID','00Q7XXXXxxxxxxx');
        // inputParams.put('isMember',true);
        inputParams.put('ConvertedStatus',convertStatus.MasterLabel);

        Process.PluginRequest request = new Process.PluginRequest(inputParams);
        Process.PluginResult result;
        try {
            result = aLeadPlugin.invoke(request);
        }
        catch (Exception e) {
            System.debug('EXCEPTION' + e);
            System.AssertEquals(1,1);
        }

    }


    /*
     * This test is to test the describe() method
     */
    static testMethod void describeTest() {

        DFJ_ConvertLeads aLeadPlugin = new DFJ_ConvertLeads();
        Process.PluginDescribeResult result = aLeadPlugin.describe();

        System.AssertEquals(result.inputParameters.size(), 11);
        System.AssertEquals(result.OutputParameters.size(), 3);

    }

    /*
     * Test that on conversion of lead costledger account is populating.
     */
    static testMethod void basicTestwithAccountsAndCostLedger() {

        // Create dummy lead
        List<Lead> listLead = DFJ_TestDataFactory.CreateleadWithLedgerForLeadConversion(1, 1);

        List<Account> testAccount1 = DFJ_TestDataFactory.CreateAccounts(1);

        LeadStatus convertStatus = [Select Id, MasterLabel from LeadStatus where IsConverted=true limit 1];

        // Create dummy conversion
        DFJ_ConvertLeads aLeadPlugin = new DFJ_ConvertLeads();
        Map<String,Object> inputParams = new Map<String,Object>();
        Map<String,Object> outputParams = new Map<String,Object>();

        inputParams.put('LeadID',listLead[0].ID);
        // inputParams.put('isMember',true);
        inputParams.put('ConvertedStatus',convertStatus.MasterLabel);

        Process.PluginRequest request = new Process.PluginRequest(inputParams);
        Process.PluginResult result;
        result = aLeadPlugin.invoke(request);

        Lead aLead = [select name, id, isConverted, convertedAccountID from Lead where id = :listLead[0].Id];
        Cost_Ledger__c costLedger = [SELECT Id,Name,Lead__c,Account__c FROM Cost_Ledger__c WHERE Lead__c =:listLead[0].Id LIMIT 1];

        System.Assert(aLead.isConverted);
        System.assert(costLedger.Account__c != null);
    }
   @isTest
    public static void getMetadataMembershipTest(){
         // Create dummy lead
        Lead testLead = new Lead(Company='Din Familiejurist ApS',FirstName='John',LastName='Doe',Provider_id__c = '1324',OwnerId=UserInfo.getUserId(),RecordTypeId=getDfjDkRecordTypeId(),Market_Unit__c='DFJ_DK');
        insert testLead;
        
       // Account testAcc = [Select Id FROM account WHERE Lead__c=: testLead.Id];
       // System.debug('testAcc-->'+testAcc);
       
        List<Journal__c> getJournal = new List<Journal__c>();
        Journal__c newJournal = new Journal__c();
        newJournal.Lead__c = testLead.Id;
        newJournal.DocFab_Record_Model_ID__c = '54';
        newJournal.External_record_uuid__c = '1234';
        newJournal.Contains_Custom_Documents__c = false;
        getJournal.add(newJournal);
        insert newJournal;
        df_journal_dk__c testjournaldk = new df_journal_dk__c();
        testjournaldk.Journal__c = getJournal[0].Id;
        testjournaldk.uuid__c = '1234';
        testjournaldk.person_1_cpr__c = 'test';
        testjournaldk.person_1_first_name__c = 'abc';
        testjournaldk.person_1_last_name__c = 'tset';
        testjournaldk.person_2_first_name__c = 'Test2';
        testjournaldk.person_2_last_name__c = 'test';
        testjournaldk.person_1_email__c = 'abc@abc.com';	
        testjournaldk.person_1_phone__c = '1234';	
        testjournaldk.person_2_email__c = 'abc@abc.com';	
        testjournaldk.person_2_phone__c = '234567';
        testjournaldk.nsker_medlemskab_person_1__c = true;
        testjournaldk.nsker_medlemskab_person_2__c =true;
        insert testjournaldk;
      //  System.debug('testjournaldk->'+testjournaldk);
        
        List<df_54_prrende_begge_personer__c> childRec = new List<df_54_prrende_begge_personer__c>();
        df_54_prrende_begge_personer__c childInst = new df_54_prrende_begge_personer__c();
        childInst.journal_dk__c = testjournaldk.Id;
        childInst.fornavn_prrende__c = 'Test';
        childInst.telefonnummer_prrende__c ='1234';
        childInst.email_prrende__c = 'abc@abc.com';
        childInst.hvem_er_denne_person_prrende_for__c = 'prrende_for_person1';
        childRec.add(childInst);
        insert childRec;
		
        LeadStatus convertStatus = [Select Id, MasterLabel from LeadStatus where IsConverted=true limit 1];

        // Create dummy conversion
        DFJ_ConvertLeads aLeadPlugin = new DFJ_ConvertLeads();
        Map<String,Object> inputParams = new Map<String,Object>();
        Map<String,Object> outputParams = new Map<String,Object>();

        inputParams.put('LeadID',testLead.ID);
        // inputParams.put('isMember',true);
        inputParams.put('ConvertedStatus',convertStatus.MasterLabel);

        Process.PluginRequest request = new Process.PluginRequest(inputParams);
        Process.PluginResult result;
        result = aLeadPlugin.invoke(request);
		
        Lead aLead = [select name, id, isConverted from Lead where id = :testLead.ID];
     //   System.debug('aLead-->'+aLead);
        DFJ_MembershipController testInstance = new DFJ_MembershipController(aLead.Id);
        Test.startTest();
            System.enqueueJob(testInstance);
          Test.stopTest();
       // test.startTest();
       // DFJ_MembershipController.createMembershipOnLeadConvert(getJournal,aLead.Id,testAcc.Id);
        System.Assert(aLead.isConverted);
    }
    @isTest
    public static void getMetadataMembershipTest3(){
         // Create dummy lead
        Lead testLead = new Lead(Company='Din Familiejurist ApS',FirstName='John',LastName='Doe',Provider_id__c = '1324',OwnerId=UserInfo.getUserId(),RecordTypeId=getDfjDkRecordTypeId(),Market_Unit__c='DFJ_DK');
        insert testLead;
        
       // Account testAcc = [Select Id FROM account WHERE Lead__c=: testLead.Id];
       // System.debug('testAcc-->'+testAcc);
       
       
        List<Journal__c> getJournal = new List<Journal__c>();
        Journal__c newJournal = new Journal__c();
        newJournal.Lead__c = testLead.Id;
        newJournal.DocFab_Record_Model_ID__c = '54';
        newJournal.External_record_uuid__c = '1234';
        newJournal.Contains_Custom_Documents__c = false;
        getJournal.add(newJournal);
        insert newJournal;
        df_journal_dk__c testjournaldk = new df_journal_dk__c();
        testjournaldk.Journal__c = getJournal[0].Id;
        testjournaldk.uuid__c = '1234';
        testjournaldk.person_1_cpr__c = 'test';
        testjournaldk.person_1_first_name__c = 'abc';
        testjournaldk.person_1_last_name__c = 'tset';
        testjournaldk.person_2_first_name__c = 'Test2';
        testjournaldk.person_2_last_name__c = 'test';
        testjournaldk.person_1_email__c = 'abc@abc.com';	
        testjournaldk.person_1_phone__c = '1234';	
        testjournaldk.person_2_email__c = 'abc@abc.com';	
        testjournaldk.person_2_phone__c = '234567';
        testjournaldk.nsker_medlemskab_person_1__c = true;
        testjournaldk.nsker_medlemskab_person_2__c =true;
        insert testjournaldk;
      //  System.debug('testjournaldk->'+testjournaldk);
        
        List<df_54_prrende_begge_personer__c> childRec = new List<df_54_prrende_begge_personer__c>();
        df_54_prrende_begge_personer__c childInst = new df_54_prrende_begge_personer__c();
        childInst.journal_dk__c = testjournaldk.Id;
        childInst.fornavn_prrende__c = 'Test';
        childInst.telefonnummer_prrende__c ='1234';
        childInst.email_prrende__c = 'abc@abc.com';
        childInst.hvem_er_denne_person_prrende_for__c = 'prrende_for_person2';
        childRec.add(childInst);
        insert childRec;
		
        LeadStatus convertStatus = [Select Id, MasterLabel from LeadStatus where IsConverted=true limit 1];

        // Create dummy conversion
        DFJ_ConvertLeads aLeadPlugin = new DFJ_ConvertLeads();
        Map<String,Object> inputParams = new Map<String,Object>();
        Map<String,Object> outputParams = new Map<String,Object>();

        inputParams.put('LeadID',testLead.ID);
        // inputParams.put('isMember',true);
        inputParams.put('ConvertedStatus',convertStatus.MasterLabel);

        Process.PluginRequest request = new Process.PluginRequest(inputParams);
        Process.PluginResult result;
        result = aLeadPlugin.invoke(request);
		
        Lead aLead = [select name, id, isConverted from Lead where id = :testLead.ID];
    //    System.debug('aLead-->'+aLead);
        DFJ_MembershipController testInstance = new DFJ_MembershipController(aLead.Id);
        Test.startTest();
            System.enqueueJob(testInstance);
          Test.stopTest();
       // test.startTest();
       // DFJ_MembershipController.createMembershipOnLeadConvert(getJournal,aLead.Id,testAcc.Id);
        System.Assert(aLead.isConverted);
    }
  /*  @isTest
    public static void getMetadataMembershipTest2(){
         // Create dummy lead
        Lead testLead = new Lead(Company='Test Lead',FirstName='John',LastName='Doe',Provider_id__c = '1324');
        insert testLead;
        
       // Account testAcc = [Select Id FROM account WHERE Lead__c=: testLead.Id];
       // System.debug('testAcc-->'+testAcc);
       
        List<Journal__c> getJournal = new List<Journal__c>();
        Journal__c newJournal = new Journal__c();
        newJournal.Lead__c = testLead.Id;
        newJournal.DocFab_Record_Model_ID__c = '160';
        getJournal.add(newJournal);
        insert newJournal;
        df_journal_dk_new__c testjournaldk = new df_journal_dk_new__c();
        testjournaldk.Journal__c = getJournal[0].Id;
        testjournaldk.uuid__c = '1234';
        testjournaldk.p1_fornavn__c = 'abc';
        testjournaldk.p1_efternavn__c = 'tset';
        testjournaldk.p2_fornavn__c = 'Test2';
        testjournaldk.p2_efternavn__c = 'test';
        testjournaldk.p1_email__c = 'abc@abc.com';	
        testjournaldk.p1_telefon__c = '1234';	
        testjournaldk.p2_email__c = 'abc@abc.com';	
        testjournaldk.p2_telefon__c = '234567';
        insert testjournaldk;
        System.debug('testjournaldk->'+testjournaldk);
        df_160_person__c personInst = new df_160_person__c();
        personInst.person_hidden_person_1__c = true;
        personInst.journal_dk_new__c = testjournaldk.Id;
        personInst.person_hidden_person_2__c = true;
        personInst.person_medlem_dfj__c = true;
        insert personInst;
		
        LeadStatus convertStatus = [Select Id, MasterLabel from LeadStatus where IsConverted=true limit 1];

        // Create dummy conversion
        DFJ_ConvertLeads aLeadPlugin = new DFJ_ConvertLeads();
        Map<String,Object> inputParams = new Map<String,Object>();
        Map<String,Object> outputParams = new Map<String,Object>();

        inputParams.put('LeadID',testLead.ID);
        // inputParams.put('isMember',true);
        inputParams.put('ConvertedStatus',convertStatus.MasterLabel);

        Process.PluginRequest request = new Process.PluginRequest(inputParams);
        Process.PluginResult result;
        result = aLeadPlugin.invoke(request);
		
        Lead aLead = [select name, id, isConverted from Lead where id = :testLead.ID];
        System.debug('aLead-->'+aLead);
        
       // test.startTest();
       // DFJ_MembershipController.createMembershipOnLeadConvert(getJournal,aLead.Id,testAcc.Id);
        System.Assert(aLead.isConverted);
    }*/
    
     @isTest
    public static void getMetadataMembershipTest4(){
         // Create dummy lead
        Lead testLead = new Lead(Company='Din Familiejurist ApS',FirstName='John',LastName='Doe',Provider_id__c = '1324',OwnerId=UserInfo.getUserId(),RecordTypeId=getDfjDkRecordTypeId(),Market_Unit__c='DFJ_DK');
        insert testLead;
        
       // Account testAcc = [Select Id FROM account WHERE Lead__c=: testLead.Id];
       // System.debug('testAcc-->'+testAcc);
       
       
        List<Journal__c> getJournal = new List<Journal__c>();
        Journal__c newJournal = new Journal__c();
        newJournal.Lead__c = testLead.Id;
        newJournal.DocFab_Record_Model_ID__c = '54';
        newJournal.External_record_uuid__c = '1234';
        newJournal.Contains_Custom_Documents__c = false;
        getJournal.add(newJournal);
        insert newJournal;
        df_journal_dk__c testjournaldk = new df_journal_dk__c();
        testjournaldk.Journal__c = getJournal[0].Id;
        testjournaldk.uuid__c = '1234';
        testjournaldk.person_1_cpr__c = 'test';
        testjournaldk.person_1_first_name__c = 'abc';
        testjournaldk.person_1_last_name__c = 'tset';
        testjournaldk.person_2_first_name__c = 'Test2';
        testjournaldk.person_2_last_name__c = 'test';
        testjournaldk.person_1_email__c = 'abc@abc.com';	
        testjournaldk.person_1_phone__c = '1234';	
        testjournaldk.person_2_email__c = 'abc@abc.com';	
        testjournaldk.person_2_phone__c = '234567';
        testjournaldk.nsker_medlemskab_person_1__c = true;
        testjournaldk.nsker_medlemskab_person_2__c =true;
        insert testjournaldk;
     //   System.debug('testjournaldk->'+testjournaldk);
        
        List<df_54_prrende_begge_personer__c> childRec = new List<df_54_prrende_begge_personer__c>();
        df_54_prrende_begge_personer__c childInst = new df_54_prrende_begge_personer__c();
        childInst.journal_dk__c = testjournaldk.Id;
        childInst.fornavn_prrende__c = 'Test';
        childInst.telefonnummer_prrende__c ='1234';
        childInst.email_prrende__c = 'abc@abc.com';
        childInst.hvem_er_denne_person_prrende_for__c = 'prrende_begge';
        childRec.add(childInst);
        insert childRec;
		
        LeadStatus convertStatus = [Select Id, MasterLabel from LeadStatus where IsConverted=true limit 1];

        // Create dummy conversion
        DFJ_ConvertLeads aLeadPlugin = new DFJ_ConvertLeads();
        Map<String,Object> inputParams = new Map<String,Object>();
        Map<String,Object> outputParams = new Map<String,Object>();

        inputParams.put('LeadID',testLead.ID);
        // inputParams.put('isMember',true);
        inputParams.put('ConvertedStatus',convertStatus.MasterLabel);

        Process.PluginRequest request = new Process.PluginRequest(inputParams);
        Process.PluginResult result;
        result = aLeadPlugin.invoke(request);
		
        Lead aLead = [select name, id, isConverted from Lead where id = :testLead.ID];
       // System.debug('aLead-->'+aLead);
        DFJ_MembershipController testInstance = new DFJ_MembershipController(aLead.Id);
        Test.startTest();
            System.enqueueJob(testInstance);
          Test.stopTest();
       // test.startTest();
       // DFJ_MembershipController.createMembershipOnLeadConvert(getJournal,aLead.Id,testAcc.Id);
        System.Assert(aLead.isConverted);
    }
    
}