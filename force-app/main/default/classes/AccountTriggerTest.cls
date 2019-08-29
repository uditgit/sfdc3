@isTest
private class AccountTriggerTest {
    
    @isTest
    private static void testAccountTrigger(){
        List<Account> lstAccounts = new List<Account>();
        for(Integer i = 0; i<200; i++){
            Account acc = new Account();
            acc.Name = 'Account'+i;
            acc.BillingState = 'CA';
            lstAccounts.add(acc);
        }
        insert lstAccounts;
        lstAccounts.clear();
        lstAccounts = [SELECT BillingState, ShippingState FROM Account];
        for(Account acc : lstAccounts){
            System.assert(acc.BillingState == acc.ShippingState);
        }
    }

}