@isTest
public class DailyLeadProcessorTest {
	@testSetup
    static void setup(){
        List<Lead> lstLeads = new List<Lead>();
        for(Integer i =1; i<=200; i++){
            Lead l = new Lead(LastName='Lead'+i, Company='Comp'+i);
            lstLeads.add(l);
        }
        insert lstLeads;
    }
    
    @isTest
    static void testcl(){
        String cronExp = '0 0 0 15 3 ? 2022';
        Test.startTest();
        System.schedule('DailyLeadProcessor', cronExp, new DailyLeadProcessor());
        Test.stopTest();
        System.assertEquals(200, [SELECT count() FROM Lead WHERE LeadSource='Dreamforce']);
        
    }
}