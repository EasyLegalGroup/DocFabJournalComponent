/**
 * Created by Shubham Sharma on 01-03-2019.
 */
@isTest
public with sharing class AgentReport_Controller_Test {

    @isTest
    private static void fetchReportData_Apex_Test(){

        String recordTypeId  = Schema.getGlobalDescribe().get('Account').getDescribe().getRecordTypeInfosByName().get('Personkonto').getRecordTypeId();

        System.debug('recordTypeId---'+recordTypeId);
        Account accountInstance = new Account();
        accountInstance.RecordTypeID=Id.valueOf(recordTypeId);
        accountInstance.FirstName='Test FName';
        accountInstance.LastName='Test LName';
        accountInstance.Sales_value__c=10.0;
        insert accountInstance;
        System.debug('accountInstance--'+accountInstance);

        Lead leadInstance = new Lead();
        leadInstance.FirstName = 'TestLead';
        leadInstance.LastName= 'Test Last Name';
        leadInstance.Company = 'Test Company';
        leadInstance.LeadSource = 'Sales Development - Inbound';
        leadInstance.telegenta__Last_Contact_State__c = 'No answer or voicemail';
        leadInstance.Provider_id__c = '1122';
        leadInstance.Phone='+4511223344';
        insert leadInstance;

        leadInstance.telegenta__Last_Contact_State__c = 'Number busy';
        update leadInstance;

        telegenta__Telegenta_Call_History__c callInstance = new telegenta__Telegenta_Call_History__c();
        callInstance.telegenta__Account__c = accountInstance.Id;
        callInstance.telegenta__Destination_Country__c = 'Denmark';
        callInstance.telegenta__Direction__c = 'OUTBOUND';
        callInstance.telegenta__Privacy__c = true;
        insert callInstance;

        Test.startTest();
        AgentReport_Controller.fetchReportData_Apex('Today',null,null);
        AgentReport_Controller.fetchReportData_Apex('Yesterday',null,null);
        AgentReport_Controller.fetchReportData_Apex('Last 7 Days',null,null);
        AgentReport_Controller.fetchReportData_Apex('Last 30 Days',null,null);
        AgentReport_Controller.fetchReportData_Apex('THIS WEEK',null,null);
        AgentReport_Controller.fetchReportData_Apex('LAST WEEK',null,null);
        AgentReport_Controller.fetchReportData_Apex('THIS MONTH',null,null);
        AgentReport_Controller.fetchReportData_Apex('LAST MONTH',Date.today().addDays(-4),Date.today().addDays(4));
        Test.stopTest();
    }

}