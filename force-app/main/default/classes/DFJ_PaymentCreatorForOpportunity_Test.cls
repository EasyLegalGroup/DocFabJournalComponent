/**
 * @description Test class for DFJ_PaymentCreatorForOpportunity class
 */
@isTest
public class DFJ_PaymentCreatorForOpportunity_Test {
    
    @isTest
    static void testGetDataForConfirmOrderPage() {
        // Setup test data
        Account testAccount = new Account(
            Name = 'Test Account',
        Phone = '+4512345678',
        BillingCity = 'Test City',
        BillingCountry = 'Test Country',
        BillingState = 'Test State',
        BillingPostalCode = '12345',
        BillingStreet = '123 Test St'
            );
        insert testAccount;
        
        // Create a Pricebook and a Product
        id standardPriceBook = Test.getStandardPriceBookId();
        
        Product2 testProduct = new Product2(
            Name = 'Test Product',
        IsActive = true,
            Product_Identifier__c = 'PI1'
            );
        insert testProduct;
        
        PricebookEntry testPricebookEntry = new PricebookEntry(
            Pricebook2Id = standardPricebook,
        Product2Id = testProduct.Id,
        UnitPrice = 100,
        IsActive = true
            );
        insert testPricebookEntry;
        
        // Create an Opportunity
        Opportunity testOpportunity = new Opportunity(
            Name = 'Test Opportunity',
        CloseDate = Date.today(),
        StageName = 'Prospecting',
        AccountId = testAccount.Id,
        Order_Total__c = 100
            );
        insert testOpportunity;
        
        // Create an OpportunityLineItem
        OpportunityLineItem testLineItem = new OpportunityLineItem(
            OpportunityId = testOpportunity.Id,
        Quantity = 1,
        PricebookEntryId = testPricebookEntry.Id,
        Discount = 0,
        TotalPrice = 100
            );
        insert testLineItem;
        
        // Test the getDataForConfirmOrderPage method
        Test.startTest();
        DFJ_PaymentCreatorForOpportunity_Apex.ProductsWrapper result = DFJ_PaymentCreatorForOpportunity_Apex.getDataForConfirmOrderPage(String.valueOf(testOpportunity.Id));
        Test.stopTest();
        
        // Verify the result
        // Assert that the result is not null
        System.assertNotEquals(null, result, 'Expected result to be not null.');
        
        // Assert that the opportunity record instance is not null
        System.assertNotEquals(null, result.opportunityRecordInstance, 'Expected opportunityRecordInstance to be not null.');
        
        // Assert that the opportunity record ID matches the test opportunity ID
        System.assertEquals(testOpportunity.Id, result.opportunityRecordInstance.Id,
        'Expected opportunityRecordInstance ID to match testOpportunity ID.');
        
        // Assert that the account record instance is not null
        System.assertNotEquals(null, result.accountRecordInstance, 'Expected accountRecordInstance to be not null.');
        
        // Assert that the account record ID matches the test account ID
        System.assertEquals(testAccount.Id, result.accountRecordInstance.Id,
        'Expected accountRecordInstance ID to match testAccount ID.');
        
        // Assert that the opportunity products data is not null
        System.assertNotEquals(null, result.opportunityProductsData, 'Expected opportunityProductsData to be not null.');
        
        // Assert that the size of opportunity products data is 1
        System.assertEquals(1, result.opportunityProductsData.size(),
        'Expected opportunityProductsData size to be 1.');
        
        // Assert that the line item ID matches the test line item ID
        System.assertEquals(testLineItem.Id, result.opportunityProductsData[0].Id,
        'Expected opportunityProductsData[0] ID to match testLineItem ID.');
        
    }
}