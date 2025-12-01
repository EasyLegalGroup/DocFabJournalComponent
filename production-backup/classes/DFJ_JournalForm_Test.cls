/**
 * Created by shubh on 14-08-2019.
 */
@isTest
public with sharing class DFJ_JournalForm_Test {
    
   /* @TestSetup
    static void makeData(){
       List<Journal__c> journalInstance = new List <Journal__c>{new Journal__c(Market_Unit__c='DFJ_DK',Type__c='Inheritance',External_record_uuid__c='TestExtRecId'),new Journal__c(Market_Unit__c='DFJ_DK')};
        insert journalInstance;
        Doc_Fabricator_Setting__c APIKeyInstance = new Doc_Fabricator_Setting__c();
        APIKeyInstance.API_Key__c = 'M0mOH7wOd5PZkGsDTH8qcOwPBOK77J';
        APIKeyInstance.URL__c = 'https://admin.docfabricator.com/';
        insert APIKeyInstance;
        
    }*/

    @isTest
    private static void getJournalData_Apex_Test(){

        Account acc = new Account();
        acc.Name = 'Test';
        insert acc;

        Journal__c journalInstance = new Journal__c();
        journalInstance.Has_Children__c = true;
        journalInstance.All_children_over_18__c = true;
        journalInstance.Account__c = acc.Id;
        insert journalInstance;

        Person__c personSInstance = new Person__c();
        personSInstance.Address__c = 'test';
        personSInstance.City__c = 'test';
        personSInstance.Journal__c = journalInstance.Id;
        insert personSInstance;

        Assests__c AssestInstance = new Assests__c();
        AssestInstance.CPR_Number__c = 'test';
        AssestInstance.Journal_Id__c = journalInstance.Id;
        insert AssestInstance;

        Test.startTest();
        DFJ_JournalForm.getJournalData_Apex(null,null,null,false);
        DFJ_JournalForm.getJournalData_Apex(journalInstance.Id,null,null,false);
        DFJ_JournalForm.getJournalData_Apex(acc.Id,null,null,false);


        Person__c personpNewInstance = new Person__c();
        personpNewInstance.Address__c = 'test';
        personpNewInstance.City__c = 'test';
        personpNewInstance.Journal__c = journalInstance.Id;
        insert personpNewInstance;


        Assests__c AssestNewInstance = new Assests__c();
        AssestNewInstance.CPR_Number__c = 'test';
        AssestNewInstance.Journal_Id__c = journalInstance.Id;
        insert AssestNewInstance;

        List<Person__c> peopleList = new List<Person__c>();
        peopleList.add(personpNewInstance);
        List<Assests__c> AssestsList = new List<Assests__c>();
        AssestsList.add(AssestNewInstance);

        Person__c personSGInstance = new Person__c();
        personSGInstance.Address__c = 'test';
        personSGInstance.City__c = 'test';
        personSGInstance.Journal__c = journalInstance.Id;
        insert personSGInstance;

        Person__c personSG2Instance = new Person__c();
        personSG2Instance.Address__c = 'test';
        personSG2Instance.City__c = 'test';
        personSG2Instance.Journal__c = journalInstance.Id;
        insert personSG2Instance;

        Person__c personShInstance = new Person__c();
        personShInstance.Address__c = 'test';
        personShInstance.City__c = 'test';
        personShInstance.Journal__c = journalInstance.Id;
        insert personShInstance;

        Person__c personpInstance = new Person__c();
        personpInstance.Address__c = 'test';
        personpInstance.City__c = 'test';
        personpInstance.Journal__c = journalInstance.Id;
        insert personpInstance;


        DFJ_JournalForm.insertJournaldata_Apex(JSON.serialize(journalInstance),
                JSON.serialize(peopleList),
                JSON.serialize(AssestsList),
                JSON.serialize(new List<String>{personSInstance.Id}),
                JSON.serialize(new List<String>{personSInstance.Id}),
                JSON.serialize(new List<String>{personSGInstance.Id}),
                JSON.serialize(new List<Person__c>{personSG2Instance}),
                JSON.serialize(new List<String>{personShInstance.Id}),
                JSON.serialize(new List<String>{personpInstance.Id})
        );
        DFJ_JournalForm.insertJournaldata_Apex(JSON.serialize(journalInstance),
                null,
                null,
                null,
                JSON.serialize(new List<String>{personSInstance.Id}),
                JSON.serialize(new List<String>{personSGInstance.Id}),
                JSON.serialize(new List<Person__c>{personSG2Instance}),
                JSON.serialize(new List<String>{personShInstance.Id}),
                JSON.serialize(new List<String>{personpInstance.Id})
        );

        // Create dummy lead
        Lead testLead = new Lead(Company='Test Lead',FirstName='John',LastName='Doe',Provider_id__c = '1324');
        insert testLead;

        DFJ_JournalForm.journalAssociatedWithLead(testLead.Id);
        Test.stopTest();


    }

    @isTest
    public static void updateLeadValues_Apex_Test(){
        Lead leadInstance = new Lead();
        leadInstance.FirstName = 'Test';
        leadInstance.LastName = 'Test';
        leadInstance.Email = 'test@mail.com';
        leadInstance.City = 'TestCity';
        leadInstance.Street = 'TestSTreet';
        leadInstance.PostalCode = '125888';
        leadInstance.Provider_id__c = '14524';
        leadInstance.Street='sa\'';
         insert leadInstance;

        Test.startTest();
        DFJ_JournalForm.updateLeadValues_Apex(JSON.serialize(leadInstance));
        DFJ_JournalForm.updateLeadValues_Apex(null);
         DFJ_JournalForm.updateLeadValues_Apex( 'hi');
        Test.stopTest();

    }

    @isTest
    public static void addErrorLogsInSalesforce_Apex_Test(){
        Log__c logInstance = new Log__c();
        logInstance.Event__c = 'TestEvent';
        logInstance.Message__c = 'TestMessage';
        logInstance.Severity__c = 'ERROR';
        logInstance.Source__c = 'TestSource';
        Test.startTest();
        DFJ_JournalForm.addErrorLogsInSalesforce_Apex(JSON.serialize(logInstance));
        DFJ_JournalForm.addErrorLogsInSalesforce_Apex(null);
        Test.stopTest();
    }

    @isTest
    public static void updateJournalFields_Apex_Test(){
       Profile pf = [Select Id from profile where Name = 'System Administrator'];

        String orgId = UserInfo.getOrganizationId();
        String dateString = String.valueof(Datetime.now()).replace(' ', '').replace(':', '').replace('-', '');
        Integer RandomId = Integer.valueOf(Math.rint(Math.random() * 1000000));
        String uniqueName = orgId + dateString + RandomId;

        User uu = new User(firstname = 'ABC',
                lastName = 'XYZ',
                email = uniqueName + '@test' + orgId + '.org',
                Username = uniqueName + '@test' + orgId + '.org',
                EmailEncodingKey = 'ISO-8859-1',
                Alias = uniqueName.substring(18, 23),
                TimeZoneSidKey = 'America/Los_Angeles',
                LocaleSidKey = 'en_US',
                LanguageLocaleKey = 'en_US',
                ProfileId = pf.Id
                /*UserRoleId = obj.Id*/);
        insert uu;
        Date myDate = Date.newInstance(2020, 2, 17);
        Journal__c journalInstance = new Journal__c();
        journalInstance.Amount__c = '1233';
        journalInstance.Responsible_Lawyer__c = uu.Id;
        insert journalInstance;


        Test.startTest();
        //Remove the type param from the class method
        DFJ_JournalForm.updateJournalFields_Apex('new',myDate,journalInstance.Id,uu.Id,'Retten i Lyngby');
        Test.stopTest();

    }

    @isTest
    public static void insertEventData_Apex_Test(){
        Journal__c journalInstance = new Journal__c();
        journalInstance.Amount__c = '1233';
        insert journalInstance;

        Event eventInstance = new Event();
        eventInstance.WhatId = journalInstance.Id;
        eventInstance.DurationInMinutes = 0;
        eventInstance.ActivityDateTime = System.now();
        eventInstance.StartDateTime = System.now();
        eventInstance.EndDateTime = DateTime.now();
        Test.startTest();
        DFJ_JournalForm.insertEventData_Apex(null,null);
        DFJ_JournalForm.insertEventData_Apex(JSON.serialize(eventInstance),null);
        Test.stopTest();
    }

    @isTest
    public static void getJournalStatusAndDeadline_Apex_Test(){
        Lead testLead = new Lead(Street='sa\'',Company='Test Lead',FirstName='John',LastName='Doe',Provider_id__c = '1324');
        insert testLead;
        Test.startTest();
        DFJ_JournalForm.getJournalStatusAndDeadline_Apex(null);
        DFJ_JournalForm.getJournalStatusAndDeadline_Apex(testLead.Id);
        Test.stopTest();
    }


    @isTest
    private static void journalAssociatedWithLead_Test(){
        List<Lead> listOfLead = new List<Lead>{new lead(Street='sa\'',Provider_id__c='432211129',LastName='TestLastName',Civil_status__c='Gift',Children_type__c = 'Fælles børn'),new Lead(Street='sa\'',Provider_id__c='432211121',LastName='TestLastName',Civil_status__c='Enlig',Children_type__c = 'Sammenbragte børn'),new Lead(Street='sa\'',Provider_id__c='432211120',LastName='TestLastName',Civil_status__c='Samlevende',Children_type__c = 'Begge dele')};
        insert listOfLead;
        List<Journal__c> listOfJournals = new List<Journal__c>{new Journal__c(Lead__c=listOfLead[0].Id),new Journal__c(Lead__c=listOfLead[1].Id),new Journal__c(Lead__c=listOfLead[2].Id)};
        insert listOfJournals;
        Test.startTest();
        List<Journal__c> journalOne= DFJ_JournalForm.journalAssociatedWithLead(listOfLead[0].Id);
        List<Journal__c> journalTwo = DFJ_JournalForm.journalAssociatedWithLead(listOfLead[1].Id);
        List<Journal__c> journalThree= DFJ_JournalForm.journalAssociatedWithLead(listOfLead[2].Id);
        test.stopTest();
        system.assertEquals(listOfLead[0].Id, journalOne[0].Lead__c);
        system.assertEquals(listOfLead[1].Id, journalTwo[0].Lead__c);
        system.assertEquals(listOfLead[2].Id, journalThree[0].Lead__c);
    }

    @isTest
    private static void GetJournalDataMarketNotDFJ_Apex_Test(){
		
		List<Journal__c> journalInstance = new List <Journal__c>{new Journal__c(Market_Unit__c='DFJ_DK',Type__c='Inheritance',External_record_uuid__c='TestExtRecId'),new Journal__c(Market_Unit__c='DFJ_DK')};
        insert journalInstance;

        Doc_Fabricator_Setting__c APIKeyInstance = new Doc_Fabricator_Setting__c();
        APIKeyInstance.API_Key__c = 'M0mOH7wOd5PZkGsDTH8qcOwPBOK77I';
        APIKeyInstance.URL__c = 'https://admin.docfabricator.com/';
        insert APIKeyInstance;
       // List<Journal__c> journalInstance = [SELECT Id,Market_Unit__c,External_record_uuid__c FROM Journal__c];
       

		Record_form_configuration__mdt md = Record_form_configuration__mdt.getInstance('Din_Familie_Jurist_Admin_of_estate');
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new DF_MockTestUtility_Apex());
        // Changes for ticket - DIN-169 : Open record content in form.
	    // Start
        // Description : Testing getJournalData_Apex when market unit is non DFJ_DK and has external_record_uuid.
        DFJ_JournalForm.journalWholeData testTwo = DFJ_JournalForm.getJournalData_Apex(journalInstance[1].Id, 'Journal__c', '',true);
        // End
        // Changes for ticket - DIN-169 : Open record content in form.
	    // Start
        // Description : Testing getJournalData_Apex when market unit is non DFJ_DK and not external_record_uuid present.
        DFJ_JournalForm.journalWholeData testOne = DFJ_JournalForm.getJournalData_Apex(journalInstance[0].Id, 'Journal__c', '',true);
        DFJ_JournalForm.journalWholeData testThree = DFJ_JournalForm.getJournalData_Apex(journalInstance[0].Id, 'Journal__c', '',false);
        DFJ_JournalForm.journalWholeData testFour = DFJ_JournalForm.getJournalData_Apex(journalInstance[1].Id, 'Journal__c', '',false);
        // End
        Test.stopTest();
        // System.assertEquals('https://admin.docfabricator.com/public/form/TestExtRecId/'+md.Form_uuid__c+'', testOne.docFabUrl);
        System.assertEquals(null, testThree.docFabUrl);
        System.assertEquals(null, testFour.docFabUrl);
    }

    @isTest
    private static void GetJournalDataNoUserFound_Apex_Test(){

		List<Journal__c> journalInstance = new List <Journal__c>{new Journal__c(Market_Unit__c='FA_SE',External_record_uuid__c='TestExtRecId'),new Journal__c(Market_Unit__c='FA_SE')};
        insert journalInstance;
        Doc_Fabricator_Setting__c APIKeyInstance = new Doc_Fabricator_Setting__c();
        APIKeyInstance.API_Key__c = 'M0mOH7wOd5PZkGsDTH8qcOwPBOK77J';
        APIKeyInstance.URL__c = 'https://admin.docfabricator.com/';
        insert APIKeyInstance;
       // List<Journal__c> journalInstance = [SELECT Id,Market_Unit__c,External_record_uuid__c FROM Journal__c];
		Record_form_configuration__mdt md = Record_form_configuration__mdt.getInstance('Din_Familie_Jurist_Inheritance');
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new DF_MockTestUtility_Apex());
        // Changes for ticket - DIN-169 : Open record content in form.
	    // Start
        // Description : Testing getJournalData_Apex when market unit is non DFJ_DK and not external_record_uuid present.
        DFJ_JournalForm.journalWholeData testOne = DFJ_JournalForm.getJournalData_Apex(journalInstance[1].Id, 'Journal__c', '',true);
        //DFJ_JournalForm.journalWholeData testTwo = DFJ_JournalForm.getJournalData_Apex(journalInstance[1].Id, 'Journal__c', '',true); 
        // End
        Test.stopTest();
        System.assertEquals('Current user with '+UserInfo.getUserEmail()+' does not exists in the DocFabricator system.', testOne.docFabUrl);
    

    }

    @isTest
    private static void AddSectionErrors_Apex_Test(){
        Log__c logInstance = new Log__c(Affected_Record__c='testRecordId',Event__c='TestEvent',Line_Number__c='TestLine',Message__c='TestMessage',Severity__c='TestSeverity');

        Test.startTest();
        Boolean isLogAdded = DFJ_JournalForm.addSectionErrors_Apex(JSON.serialize(logInstance));
        Boolean isLogAddedNo = DFJ_JournalForm.addSectionErrors_Apex('');
        Test.stopTest();
        System.assertEquals(true, isLogAdded);
        System.assertEquals(false, isLogAddedNo);

    }
    
    //Changes DIN-383
    //Start
    @isTest
    public static void updateJournalHistroyRecord_Test(){
        Journal__c journalInstance = new Journal__c();
        journalInstance.Amount__c = '1233';
        insert journalInstance;
        
        Journal_History__c journalHistoryInstance = new Journal_History__c();
        journalHistoryInstance.Journal__c = journalInstance.Id;
        journalHistoryInstance.Journal_States_New__c = 'Gennemgang Get Accept';
        journalHistoryInstance.Journal_States_Old__c = 'new';

        Test.startTest();
        List<Journal__c> isRecordAdded = DFJ_JournalForm.updateJournalHistroyRecord(JSON.serialize(journalHistoryInstance));
        List<Journal__c> isNoRecordAdded = DFJ_JournalForm.updateJournalHistroyRecord(null);
        Test.stopTest();
        System.assertEquals(journalInstance.Id, isRecordAdded[0].Id);
        System.assertEquals(null, isNoRecordAdded);

    }
     //End

     //Changes Start TCS-53
      // Changes DFJ-77 Starts Added the String orderId param to class to associate order with Journal(if selected)
     @isTest
     private static void journalAssociatedWithAccount_Test1(){
         List<Account> listOfAccount = new List<Account>{new Account(Name = 'acc',Market_Unit__c = 'DFJ_DK')};
         insert listOfAccount;
        /* List<Journal__c> journalList = new List<Journal__c>();
         for(integer i=0;i<=1;i++){
             Journal__c journalInst = new Journal__c();
             journalInst.Account__c = listOfAccount[0].Id;
             journalList.add(journalInst);
         }
         insert journalList;*/
         Test.startTest();
         List<Journal__c> journalOne= DFJ_JournalForm.journalAssociatedWithAccount(listOfAccount[0].Id,'');
         test.stopTest();
         System.assertEquals(listOfAccount[0].Id, journalOne[0].Account__c);
     }

     //End
      // Changes DFJ-77 Starts Added the String orderId param to class to associate order with Journal(if selected)
     @isTest
     private static void journalAssociatedWithAccount_Test2(){
         List<Account> listOfAccount = new List<Account>{new Account(Name = 'acc1',Market_Unit__c = 'DFJ_DK')};
         insert listOfAccount;
         //DFJ-77 Starts 
         Order orderInst = new Order(EffectiveDate=System.today(),Status='Draft',AccountId=listOfAccount[0].Id,Market_Unit__c='Testamente_DK');
         insert orderInst;
         //
         Test.startTest();
         List<Journal__c> journalOne= DFJ_JournalForm.journalAssociatedWithAccount(listOfAccount[0].Id,orderInst.Id);
         test.stopTest();
         System.assertEquals(orderInst.Id, journalOne[0].Order__c);
     }
    @isTest
     private static void ordersAssociatedWithAccount_Test(){
         List<Account> listOfAccount = new List<Account>{new Account(Name = 'acc1',Market_Unit__c = 'DFJ_DK')};
         insert listOfAccount;
         //DFJ-77 Starts 
         Order orderInst = new Order(EffectiveDate=System.today(),Status='Draft',AccountId=listOfAccount[0].Id,Market_Unit__c='Testamente_DK');
         insert orderInst;
         //
         Test.startTest();
         List<Order> orderList= DFJ_JournalForm.ordersAssociatedWithAccount(listOfAccount[0].Id);
         test.stopTest();
         System.assertEquals(orderList.Size(), 1);
     }
    
    
	//End

}