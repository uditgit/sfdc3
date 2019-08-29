public class AddPrimaryContact implements Queueable {
    private Contact con;
    private String state;
    public AddPrimaryContact(Contact con, String state){
        this.con = con;
        this.state = state;
    }
    public void execute(QueueableContext q){
        List<Contact> lstContacts = new List<Contact>();
        List<Account> lstAccounts = [SELECT Id, Name FROM Account WHERE BillingState = :state LIMIT 200];
        for(Account a : lstAccounts){
            Contact cloneCon = con.clone(false, true, false, false);
            cloneCon.AccountId = a.Id;
            cloneCon.LastName = 'Contact'+a.Name;
            lstContacts.add(cloneCon);
        }
        insert lstContacts;
    }
}