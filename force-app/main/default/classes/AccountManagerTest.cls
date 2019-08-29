@isTest
public class AccountManagerTest {
	@isTest
    static void testGetAccount(){
        Account acc = new Account(Name='Test Account');
        insert acc;
        Contact c1 = new Contact(LastName='Contact 1', AccountId=acc.Id);
        insert c1;
        Contact c2 = new Contact(LastName='Contact 2', AccountId=acc.Id);
        insert c2;
        RestRequest request = new RestRequest();
        request.requestURI = 'https://uditsharma-dev-ed.lightning.force.com/services/apexrest/Accounts/'+acc.Id+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account thisAcc = AccountManager.getAccount();
        System.assert(thisAcc!=null);
        System.debug('Account and Contacts from REST Service'+ acc);
        System.debug('Contacts-'+[SELECT ID, Name, AccountId FROM Contact]);
    }
}