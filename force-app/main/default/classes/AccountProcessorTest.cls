@isTest
public class AccountProcessorTest {
	@testSetup
    static void setup(){
        Account acc = new Account(Name = 'Account1');
        insert acc;
        List<Contact> lstContacts = new List<Contact>();
        Contact c1 = new Contact(LastName='Contact1', AccountId = acc.Id);
        Contact c2 = new Contact(LastName='Contact2', AccountId = acc.Id);
        lstContacts.add(c1);
        lstContacts.add(c2);
        insert lstContacts;
    }
    @isTest
    static void testCountContacts(){
        List<Account> lstAccounts = [SELECT Id FROM Account];
        List<Id> accIds = new List<Id>();
        for(Account a : lstAccounts){
            accIds.add(a.Id);
        }
        Test.startTest();
        AccountProcessor.countContacts(accIds);
        Test.stopTest();
        lstAccounts.clear();
        lstAccounts = [SELECT Id, Number_of_Contacts__c FROM Account];
        System.assertEquals(2, lstAccounts[0].Number_of_Contacts__c);
    }
}