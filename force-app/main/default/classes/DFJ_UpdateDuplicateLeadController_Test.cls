@isTest
public class DFJ_UpdateDuplicateLeadController_Test {
	@isTest public static void updateDuplicateLeadMethodTest(){
		List<Lead> leadList1 = new List<Lead>();
		List<Lead> leadList2 = new List<Lead>();

		Lead ld1 = new Lead();
		ld1.LastName = 'testLead1';
		ld1.Status = 'New';
		ld1.Phone = '+4599591111';
		ld1.Phone2__c = '+4555555555';
		ld1.Phone3__c = '+4599592222';
		ld1.Provider_id__c = '99590';
		ld1.Publisher_name__c = 'facebook';
		leadList1.add(ld1);

		Lead ld2 = new Lead();
		ld2.LastName = 'testLead2';
		ld2.Status = 'New';
		ld2.Phone = '+4555555555';
		ld2.Phone2__c = '+4599593333';
		ld2.Phone3__c = '+4599594444';
		ld2.Provider_id__c = '99591';
		ld2.Publisher_name__c = 'facebook';
		leadList1.add(ld2);
		insert leadList1;

		Lead ld3 = new Lead();
		ld3.LastName = 'testLead3';
		ld3.Status = 'New';
		ld3.Phone = '+4599595555';
		ld3.Phone2__c = '+4522222222';
		ld3.Phone3__c = '+4599596666';
		ld3.Provider_id__c = '99592';
		ld3.Publisher_name__c = 'facebook';
		leadList2.add(ld3);

		Lead ld4 = new Lead();
		ld4.LastName = 'testLead4';
		ld4.Status = 'New';
		ld4.Phone = '+4599597777';
		ld4.Phone2__c = '+4599598888';
		ld4.Phone3__c = '+4522222222';
		ld4.Provider_id__c = '99593';
		ld4.Publisher_name__c = 'facebook';
		leadList2.add(ld4);
		insert leadList2;

		/*String durationRange = 'Today';
		String durationRange1 = 'Last 7 Days';
		String durationRange2 = 'Last 30 Days';
		String durationRange3 = 'Last 3 Months';*/

		Date Date1 = Date.today().addDays(-1);
		Date Date2 = date.today();

		Test.startTest();
		DFJ_UpdateDuplicateLeadController_Apex.DFJ_UpdateDuplicateLead('Today',null,null);
		DFJ_UpdateDuplicateLeadController_Apex.DFJ_UpdateDuplicateLead('Last 7 Days',null,null);
		DFJ_UpdateDuplicateLeadController_Apex.DFJ_UpdateDuplicateLead('Last 30 Days',null,null);
		DFJ_UpdateDuplicateLeadController_Apex.DFJ_UpdateDuplicateLead('Last 3 Months',null,null);
		DFJ_UpdateDuplicateLeadController_Apex.DFJ_UpdateDuplicateLead(null,Date1,Date2);
		Test.stopTest();

	}
}