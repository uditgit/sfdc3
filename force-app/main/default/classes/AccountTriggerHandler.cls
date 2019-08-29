public class AccountTriggerHandler {
    
    public static void CreateAccounts(List<Account> lstAccounts){
        List<Account> lstAccountsToInsert = new List<Account>();
        for(Account accObj : lstAccounts){
            if(accObj.BillingState == accObj.ShippingState){
                lstAccountsToInsert.add(accObj);
            }
            else{
                accObj.ShippingState = accObj.BillingState;
                lstAccountsToInsert.add(accObj);
            }
        }
    }
    
}