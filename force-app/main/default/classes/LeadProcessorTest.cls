@isTest
public class LeadProcessorTest {
    @testSetup
    static void setup(){
        List<Lead> lstLeads = new List<Lead>();
        for(integer i = 1; i<=200; i++){
            Lead ld = new Lead(LastName='Lead'+i, Company='Company'+i);
            lstLeads.add(ld);
        }
        insert lstLeads;
    }
    @isTest
    static void testBathcLeads(){
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();
        System.assertEquals(200, [SELECT count() FROM Lead WHERE LeadSource='Dreamforce']);
    }
}