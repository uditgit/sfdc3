@isTest
public class AddPrimaryContactTest {
	@testSetup
    static void setup(){
        List<Account> lstAccounts = new List<Account>();
        for(Integer i = 1; i<=50; i++){
            Account accountNY = new Account(Name = 'AccountNY'+i, BillingState='NY');
            Account accountCA = new Account(Name = 'AccountCA'+i, BillingState='CA');
            lstAccounts.add(accountNY);
            lstAccounts.add(accountCA);
        }
        insert lstAccounts;
        Contact con = new Contact(LastName='ContactHere');
        insert con;
    }
    
    @isTest
    static void testAddPrimaryContactNY(){
        List<Contact> lstContacts = [SELECT Id FROM Contact];
        AddPrimaryContact ac = new AddPrimaryContact(lstContacts[0], 'NY');
        Test.startTest();
        System.enqueueJob(ac);
        Test.stopTest();
        //System.assertEquals(50, [SELECT count() FROM Contact])
    }
    
    @isTest
    static void testAddPrimaryContactCA(){
        List<Contact> lstContacts = [SELECT Id FROM Contact];
        AddPrimaryContact ac = new AddPrimaryContact(lstContacts[0], 'CA');
        Test.startTest();
        System.enqueueJob(ac);
        Test.stopTest();
        //System.assertEquals(50, [SELECT count() FROM Contact])
    }
}