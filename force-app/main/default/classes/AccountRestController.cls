@RestResource(urlMapping = '/Account/*')
global with sharing class AccountRestController {
    
    @HttpGet
    global static Account doGet(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        List<Account> lstAccounts = [SELECT Id, Name, Phone, Website FROM Account WHERE Id = :accountId];
        return lstAccounts[0];
    }

}