@isTest
public class DFJ_ProductSelectorController_Test {
    @isTest
    private static void  getAllThePricebooks_Test(){
        Product2 productInstance =new Product2();
        // DFJ-330 changes start
        productInstance.Product_Identifier__c = 'tst';
        // DFJ-330 changes end
        productInstance.Name='test';
        productInstance.productCode='1234';
        productInstance.isActive = true;
        insert productInstance;

        Id pb2 = Test.getStandardPricebookId();
        PriceBook2 pricebookInstance=new PriceBook2();
        pricebookInstance.Id = pb2;
        update pricebookInstance;
        
        
        Test.startTest();
        	DFJ_ProductSelectorController_Apex.getAllThePricebooks_Apex();
        Test.stopTest();
    }
    
     @isTest
    private static void  fetchAllTheAvailableProducts_Apex_Test(){
        Product2 productInstance =new Product2();
         // DFJ-330 changes start
         productInstance.Product_Identifier__c = 'tst';
         // DFJ-330 changes end
        productInstance.Name='test';
        productInstance.productCode='1234';
        productInstance.isActive = true;
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
        
        Test.startTest();
        	DFJ_ProductSelectorController_Apex.fetchAllTheAvailableProducts_Apex(pb2);
        DFJ_ProductSelectorController_Apex.fetchAllTheAvailableProducts_Apex(null);
         DFJ_ProductSelectorController_Apex.getPicklistValues_Apex('Account','Rating');
        Test.stopTest();
    }
    
    @isTest
    public static void saveSelectedProducts_Apex_Test(){
        
        List<LeadProducts__c> listOfLeadProducts = new List<LeadProducts__c>();
        
        LeadProducts__c lpInstance = new LeadProducts__c();
        lpInstance.Name = 'Test';
        listOfLeadProducts.add(lpInstance);
        
        Test.startTest();
        DFJ_ProductSelectorController_Apex.saveSelectedProducts_Apex(JSON.serialize(listOfLeadProducts));
        
        Test.stopTest();
    }
    
    @isTest
    public static void getSelectedProductData_Apex_Test(){
        List<LeadProducts__c> listOfLp = new List<LeadProducts__c>();
        LeadProducts__c lp = new LeadProducts__c();
        lp.Name = 'TestLp';
        insert lp;
        listOflp.add(lp);

        Lead leadInstance = new Lead();
        leadInstance.FirstName = 'TestLead';
        leadInstance.LastName= 'Test Last Name';
        leadInstance.Company = 'Test Company';
        leadInstance.Provider_id__c = '1122';
        leadInstance.Phone='+4511223344';
        insert leadInstance;
        Test.startTest();
            DFJ_ProductSelectorController_Apex.getSelectedProductData_Apex(leadInstance.Id);
       	     DFJ_ProductSelectorController_Apex.getSelectedProductData_Apex(null);
        Test.stopTest();
    }
    
     @isTest
    public static void updateRecordOfLeadProduct_Apex_Test(){
        LeadProducts__c lpInstance = new LeadProducts__c();
        lpInstance.Name = 'Test';
        insert lpInstance;
        Test.startTest();
        DFJ_ProductSelectorController_Apex.updateRecordOfLeadProduct_Apex(lpInstance);
        Test.stopTest();
    } 
    
    
    @isTest
    public static void deleteRecordOfLeadProduct_Apex_Test(){
        
      Lead leadInstance = new Lead();
        leadInstance.FirstName = 'TestLead';
        leadInstance.LastName= 'Test Last Name';
        leadInstance.Company = 'Test Company';
        leadInstance.Provider_id__c = '1122';
        leadInstance.Phone='+4511223345';
        insert leadInstance;
        
         Product2 productInstance =new Product2();

        // DFJ-330 changes start
        productInstance.Product_Identifier__c = 'tst';
        // DFJ-330 changes end

        productInstance.Name='test';
        productInstance.productCode='1234';
        productInstance.isActive = true;

        insert productInstance;

         LeadProducts__c lpInstance = new LeadProducts__c();
        lpInstance.Name = 'Testlp';
        lpInstance.Product_Id__c = productInstance.Id;
        lpInstance.Discount__c = 0;
        lpInstance.Lead__c = leadInstance.Id;
        insert lpInstance;
        
        Test.startTest(); 
         DFJ_ProductSelectorController_Apex.deleteRecordOfLeadProduct_Apex(lpInstance.Id,leadInstance.Id);
        Test.stopTest();
    }
    
    @isTest
    public static void getAllThePricebooksAndLeadProducts_Apex_Test(){
         Lead leadInstance = new Lead();
        leadInstance.FirstName = 'TestLead';
        leadInstance.LastName= 'Test Last Name';
        leadInstance.Company = 'Test Company';
        leadInstance.Provider_id__c = '1122';
        leadInstance.Phone='+4511223346';
        leadInstance.Market_Unit__c='DFJ_DK';
        insert leadInstance;
        
         Product2 productInstance =new Product2();
        // DFJ-330 changes start
        productInstance.Product_Identifier__c = 'tst';
        // DFJ-330 changes end
        productInstance.Name='test';
        productInstance.productCode='1234';
        productInstance.isActive = true;
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
        lpInstance.Discount__c = 0;
        lpInstance.Lead__c = leadInstance.Id;
        insert lpInstance;
        
        Test.startTest();
        	 DFJ_ProductSelectorController_Apex.getAllThePricebooksAndLeadProducts_Apex(leadInstance.Id);
             DFJ_ProductSelectorController_Apex.getAllThePricebooksAndLeadProducts_Apex(null);
        Test.stopTest();
    }
    
    
     @isTest
    public static void  insertRecords_Apex_Test(){
        Lead leadInstance = new Lead();
        leadInstance.FirstName = 'TestLead';
        leadInstance.LastName= 'Test Last Name';
        leadInstance.Company = 'Test Company';
        leadInstance.Provider_id__c = '1122';
        leadInstance.Phone='+4511223346';
        insert leadInstance;
        
        Product2 productInstance =new Product2();
         // DFJ-330 changes start
         productInstance.Product_Identifier__c = 'tst';
         // DFJ-330 changes end
        productInstance.Name='test';
        productInstance.productCode='1234';
        productInstance.isActive = true;
        insert productInstance;
        
        List<LeadProducts__c> lpListForNew = new List<LeadProducts__c>();
        LeadProducts__c lpInstanceForNew = new LeadProducts__c();
        lpInstanceForNew.Name = 'TestForNew';
        lpInstanceForNew.Quantity__c = 1.0;
        lpInstanceForNew.Item_Price__c = 1020;
        lpInstanceForNew.Product_Id__c = productInstance.Id;
        lpInstanceForNew.Lead__c = leadInstance.Id;
        lpInstanceForNew.Discount__c = 10;
        insert lpInstanceForNew;
        lpListForNew.add(lpInstanceForNew);
        
        Test.startTest();
            DFJ_ProductSelectorController_Apex.insertRecords_Apex(lpListForNew,leadInstance.Id,10.0,null);
            DFJ_ProductSelectorController_Apex.changeTotalSalesValue_Apex(leadInstance.Id,10.0);
            DFJ_ProductSelectorController_Apex.changeTotalSalesValue_Apex(leadInstance.Id,null);
            DFJ_ProductSelectorController_Apex.insertFixedDiscountinLead_Apex(leadInstance);
            DFJ_ProductSelectorController_Apex.returnFixedDiscountValue_Apex(leadInstance.Id);
        Test.stopTest();
    }
    
    @isTest
    public static void testgetOrderCategorySize(){
         Lead leadInstance = new Lead();
        leadInstance.FirstName = 'TestLead';
        leadInstance.LastName= 'Test Last Name';
        leadInstance.Company = 'Test Company';
        leadInstance.Provider_id__c = '1122';
        leadInstance.Phone='+4511223348';
        leadInstance.Market_unit__c='DFJ_DK';
        insert leadInstance;
        
        Order_Category_Definition__c ocd = new Order_Category_Definition__c();
        ocd.Market_Unit__c = 'DFJ_DK';
        ocd.Order_Category_Type__c = 'Product Bundle';
        ocd.Is_Active__c = true;
        insert ocd;
        
         Test.startTest();
      	Integer count =  DFJ_ProductSelectorController_Apex.getOrderCategorySize(leadInstance.Id);
        Test.stopTest();
        System.assertEquals(count,1,'Order category size should be 1 only');
    }
}