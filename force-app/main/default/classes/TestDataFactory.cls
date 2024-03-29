@isTest
public class TestDataFactory {
    public static List<Account> createAccountsWithOpps(Integer numAccts, Integer numOppsPerAcct){
        List<Account> accts = new List<Account>();
        for(Integer i=0;i<numAccts;i++){
            Account a = new Account(Name='Test Account Factory '+ i);
            accts.add(a);
        }
        insert accts;
        
        List<Opportunity> opps = new List<Opportunity>();
        for(Integer j=0; j<numAccts;j++){
            Account acct = accts[j];
            for(Integer k=0;k<numOppsPerAcct;k++){
                opps.add(new Opportunity(Name=acct.Name + ' Opportunity '+k,
                        StageName='Prospecting',
                        CloseDate=System.today().addMonths(1),
                        AccountId=acct.Id))	;
            }
        }
        insert opps;
        return accts;
    }
}