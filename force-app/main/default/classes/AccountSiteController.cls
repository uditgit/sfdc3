@RestResource(urlMapping = '/Account')
global class AccountSiteController {
    
    @HttpGet
    global static Account doGet(){
        String accountId = RestContext.request.params.get('accountId');
        List<Account> lstAccounts = [SELECT Id, Name, Phone, Website FROM Account WHERE Id = :accountId];
        return lstAccounts[0];
    }

	@HttpPost
    global static void doPost(){
        String accountId = RestContext.request.params.get('accountId');
        String phone = RestContext.request.params.get('Phone');
        Account acc = new Account(Id=accountId, Phone=phone);
        update acc;
    }    

}