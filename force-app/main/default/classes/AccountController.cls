public with sharing class AccountController {
	@AuraEnabled
    public static List<Account> findAll(){
        return [SELECT Id, Name, Location__Latitude__s, Location__Longitude__s FROM Account
               WHERE Location__Latitude__s!=NULL AND Location__Longitude__s!=NULL LIMIT 50];
    }
    /*public static List<Account> getAllActiveAccounts() {
    return [SELECT Id,Name,Active__c FROM Account WHERE Active__c = 'Yes'];
  }*/
}