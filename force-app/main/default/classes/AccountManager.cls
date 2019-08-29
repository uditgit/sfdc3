@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        List<String> lstMapppings = request.requestURI.split('/');
        String accId = lstMapppings.get(lstMapppings.size()-2);
        System.debug('Acc Id'+ accId);
        List<Account> lstAccount = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account WHERE Id =:accId];
        System.debug('Accounts - '+ lstAccount);
        return lstAccount[0];
    }
}