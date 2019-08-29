public class AccountHandler {
    public static Account insertNewAccount(string accountName){
        Account newAccount = new Account();
        try{
            newAccount.Name = accountName;
            insert newAccount;
        }
        catch(DMLException e){
            System.debug('Insertion of account failed');
            return null;
        }
        return newAccount;
    }
}