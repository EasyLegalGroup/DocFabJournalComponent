/*
   * @Version : 1.0
   * @Created Date : 2021-09-29
   * @Description : This Test class will be used for unit testing trigger methods.
*/
@isTest
public with sharing class DFJ_MembershipTriggerHandler_Test {
    /*
     * @Description  This method is used as pre data creator.
     * @Param        No params
     * @Return       void
    */
    @testSetup static void setup() {
    }

    /*
     * @Description  This method is used to assert the functionality for posting the data on membership platform and updating membership record with profile data.
     * @Param        No params
     * @Return       void
    */
    @isTest
    private static void SetMembershipBody_Test(){
        List<Membership__c> memberships = new List<Membership__c>();
        memberships = DFJ_TestDataFactory.MembershipsWithAccounts(1,1);
        if(!memberships.isEmpty()){
            insert new DFJ_Membership_Platform_Authorizer__c(Callout_Url__c = 'https://dfj.dev-evocode.net/wp-json/dfj/user/invite');
            Test.setMock(HttpCalloutMock.class, new DFJ_MembershipMock());
            Test.startTest();
            insert memberships;
            Test.stopTest();
            List<Membership__c> membershipToAssert = new List<Membership__c>();
            membershipToAssert = [SELECT Profile_Link__c,Profile_Id__c,Platform_Create_State__c, First_Name__c, Last_Name__c, CPR__c, Phone__c, Sign_up_Date__c, Email__c, Membership_Number__c, Account__c, Name, Id FROM Membership__c WHERE Id = :memberships[0].Id LIMIT 1];

            System.assertEquals(false, membershipToAssert.isEmpty());
            System.assertEquals(1, membershipToAssert.size());
        }
    }

    /*
     * @Description  This method is used to assert the functionality for posting the data on membership platform and updating membership record with profile data.
     * @Param        No params
     * @Return       void
    */
    @isTest
    private static void SetMembershipBody_Test2(){
        List<Membership__c> memberships = new List<Membership__c>();
        memberships = DFJ_TestDataFactory.MembershipsWithAccountsNoLawyer(1,1);
        if(!memberships.isEmpty()){
            insert new DFJ_Membership_Platform_Authorizer__c(Callout_Url__c = 'https://dfj.dev-evocode.net/wp-json/dfj/user/invite');
            Test.setMock(HttpCalloutMock.class, new DFJ_MembershipMock());
            Test.startTest();
            insert memberships;
            Test.stopTest();
            List<Membership__c> membershipToAssert = new List<Membership__c>();
            membershipToAssert = [SELECT Profile_Link__c,Profile_Id__c,Platform_Create_State__c, Responsible_Lawyer__c, First_Name__c, Last_Name__c, CPR__c, Phone__c, Sign_up_Date__c, Email__c, Membership_Number__c, Account__c, Name, Id FROM Membership__c WHERE Id = :memberships[0].Id LIMIT 1];

            System.assertEquals(false, membershipToAssert.isEmpty());
            System.assertEquals(1, membershipToAssert.size());
        }
    }



    /*
     * @Description  This method is used to assert the functionality of setting membership record with failed results.
     * @Param        No params
     * @Return       void
    */
    @isTest
    private static void SetMembershipBody_Test3(){
        List<Membership__c> memberships = new List<Membership__c>();
        memberships = DFJ_TestDataFactory.MembershipsTest1WithAccountsNoLawyer(1,1);
        if(!memberships.isEmpty()){
            insert new DFJ_Membership_Platform_Authorizer__c(Callout_Url__c = 'https://dfj.dev-evocode.net/wp-json/dfj/user/invite');
            Test.setMock(HttpCalloutMock.class, new DFJ_MembershipMock());
            Test.startTest();
            insert memberships;
            Test.stopTest();
            List<Membership__c> membershipToAssert = new List<Membership__c>();
            membershipToAssert = [SELECT Profile_Link__c,Profile_Id__c,Platform_Create_State__c, Responsible_Lawyer__c, First_Name__c, Last_Name__c, CPR__c, Phone__c, Sign_up_Date__c, Email__c, Membership_Number__c, Account__c, Name, Id FROM Membership__c WHERE Id = :memberships[0].Id LIMIT 1];

            System.assertEquals(false, membershipToAssert.isEmpty());
            System.assertEquals(1, membershipToAssert.size());
        }
    }

        /*
     * @Description  This method is used to asserting when req is empty.
     * @Param        No params
     * @Return       void
    */
    @isTest
    private static void SetMembershipBody_Test4(){
        List<Membership__c> memberships = new List<Membership__c>();
        memberships = DFJ_TestDataFactory.MembershipsTest2WithAccountsNoLawyer(1,1);
        if(!memberships.isEmpty()){
            insert new DFJ_Membership_Platform_Authorizer__c(Callout_Url__c = 'https://dfj.dev-evocode.net/wp-json/dfj/user/invite');
            Test.setMock(HttpCalloutMock.class, new DFJ_MembershipMock());
            Test.startTest();
            insert memberships;
            Test.stopTest();
            List<Membership__c> membershipToAssert = new List<Membership__c>();
            membershipToAssert = [SELECT Profile_Link__c,Profile_Id__c,Platform_Create_State__c,First_Name__c, Last_Name__c, CPR__c, Phone__c, Sign_up_Date__c, Email__c, Membership_Number__c, Account__c, Name, Id FROM Membership__c WHERE Id = :memberships[0].Id LIMIT 1];

            System.assertEquals(false, membershipToAssert.isEmpty());
            System.assertEquals(1, membershipToAssert.size());
            // System.assertEquals('OK', membershipToAssert[0].Platform_Create_State__c);
        }
    }

            /*
     * @Description  This method is used to assert the functionality for posting the data on membership platform and updating membership record with profile data. (bulkified)
     * @Param        No params
     * @Return       void
    */
    @isTest
    private static void SetMembershipBody_Test5(){
        List<Membership__c> memberships = new List<Membership__c>();
        memberships = DFJ_TestDataFactory.MembershipsWithAccounts(2,20);
        if(!memberships.isEmpty()){
            insert new DFJ_Membership_Platform_Authorizer__c(Callout_Url__c = 'https://dfj.dev-evocode.net/wp-json/dfj/user/invite');
            Test.setMock(HttpCalloutMock.class, new DFJ_MembershipMock());
            Test.startTest();
            insert memberships;
            Test.stopTest();
            List<Membership__c> membershipToAssert = new List<Membership__c>();
            membershipToAssert = [SELECT Profile_Link__c,Profile_Id__c,Platform_Create_State__c,First_Name__c, Last_Name__c, CPR__c, Phone__c, Sign_up_Date__c, Email__c, Membership_Number__c, Account__c, Name, Id FROM Membership__c WHERE Id IN: memberships LIMIT 10000];

            System.assertEquals(false, membershipToAssert.isEmpty());
            System.assertEquals(40, membershipToAssert.size());
            
        }
    }

    /*
     * @Description Method to test the current user is Admin or not.
    */
    @isTest
    private static void CheckUserProfile_Test(){
        Test.startTest();
        DFJ_MembershipController.ResendMembershipWrapper wrapperInstance = DFJ_MembershipController.CheckUserProfile();
        Test.stopTest();
        System.assertEquals(true, wrapperInstance.isAdmin);
    }

    /*
     * @Description Method to test the resendwebhook.
    */
    @isTest
    private static void ResendmembershipWebhook_Test(){
        List<Membership__c> memberships = new List<Membership__c>();
        memberships = DFJ_TestDataFactory.MembershipsWithAccountsWithPendingStatus(1,1);
        insert new DFJ_Membership_Platform_Authorizer__c(Callout_Url__c = 'https://dfj.dev-evocode.net/wp-json/dfj/user/invite');
        Test.setMock(HttpCalloutMock.class, new DFJ_MembershipMock());
        Test.startTest();
        String result = DFJ_MembershipController.ResendmembershipWebhook();
        Test.stopTest();
        System.assertEquals('Updated the membership records.', result);
    }

    /*
     * @Description Method to test the resendwebhook when account not corresponding to membership.
    */
    @isTest
    private static void ResendmembershipWebhookLead_Test(){
        List<Membership__c> memberships = new List<Membership__c>();
        memberships = DFJ_TestDataFactory.MembershipsWithLeadsWithPendingStatus(1,1);
        insert new DFJ_Membership_Platform_Authorizer__c(Callout_Url__c = 'https://dfj.dev-evocode.net/wp-json/dfj/user/invite');
        Test.setMock(HttpCalloutMock.class, new DFJ_MembershipMock());
        Test.startTest();
        String result = DFJ_MembershipController.ResendmembershipWebhook();
        Test.stopTest();
        List<Membership__c> membershipName = new List<Membership__c>();
        System.assertEquals('Updated the membership records.', result);
    }

    /*
     * @Description Method to test null req body.
    */
    @isTest
    private static void ResendmembershipWebhookConstructEmptyBody_Test(){
        List<Membership__c> memberships = new List<Membership__c>();
        memberships = DFJ_TestDataFactory.MembershipsWithLeadsWithPendingStatus(1,1);
        insert new DFJ_Membership_Platform_Authorizer__c(Callout_Url__c = 'https://dfj.dev-evocode.net/wp-json/dfj/user/invite');
        Test.setMock(HttpCalloutMock.class, new DFJ_MembershipMock());
        Test.startTest();
        String result = DFJ_MembershipTriggerHandler.ConstructRequestBody(memberships ,'xyz',true,null);
        Test.stopTest();
        List<Membership__c> membershipName = new List<Membership__c>();
        System.assertEquals(true, String.isBlank(result));
    }

    @isTest
    private static void ResendmembershipWebhook_Test1(){
        insert new DFJ_Membership_Platform_Authorizer__c(Callout_Url__c = 'https://dfj.dev-evocode.net/wp-json/dfj/user/invite');
        Test.setMock(HttpCalloutMock.class, new DFJ_MembershipMock());
        Test.startTest();
        String result = DFJ_MembershipController.ResendmembershipWebhook();
        Test.stopTest();
        System.assertEquals('Record not found.', result);
    }
   
}