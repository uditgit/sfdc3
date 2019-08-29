public class AccountProcessor {
    @future
    public static void countContacts(List<Id> recordId){
        List<Account> lstAccounts = new List<Account>();
        AggregateResult[] groupedResult = [SELECT COUNT(Id), AccountId FROM Contact where AccountId IN :recordId GROUP BY AccountId];
        for(AggregateResult ar : groupedResult){
            Id accId = (Id)ar.get('AccountId');
            Integer count = (Integer)ar.get('expr0');
            Account acc = new Account(Id=accId);
            acc.Number_of_Contacts__c = count;
            lstAccounts.add(acc);
        }
        update lstAccounts;
    }
}