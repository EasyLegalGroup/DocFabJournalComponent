/**
 * Created by Shubham Sharma on 03-07-2019.
 */
@isTest
public with sharing class DFJ_checkDuplicacy_Test {

    @isTest
    private static void duplicayCheck(){
        Lead leadInstance = new Lead();
        leadInstance.FirstName = 'TestLead';
        leadInstance.LastName= 'Test Last Name';
        leadInstance.Company = 'Test Company';
        leadInstance.Provider_id__c = '1122';
        leadInstance.Phone='+4511223344';
        leadInstance.Phone2__c='+4511223355';
        leadInstance.Phone3__c='+4511223366';
        leadInstance.Publisher_name__c='Facebook';
        insert leadInstance;

        Lead leadInstance1 = new Lead();
        leadInstance1.FirstName = 'TestLead';
        leadInstance1.LastName= 'Test Last Name';
        leadInstance1.Company = 'Test Company';
        leadInstance1.Provider_id__c = '11221';
        leadInstance1.Phone='+4511223344';
        leadInstance.Phone2__c='+4511223377';
        leadInstance.Phone3__c='+4511223388';
        leadInstance1.Publisher_name__c='Facebook';
        insert leadInstance1;
    }

}