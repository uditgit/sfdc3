public class MyContactListController {
    @AuraEnabled
    public static List<Contact> getContacts(Id recordId){
        List<Contact> contactList= new List<Contact>();
        for(List<Contact> cList : [select Id, FirstName, LastName, Email, Phone From Contact Where AccountId = :recordId]){
            contactList.addAll(cList);
        }
        return contactlist; 
    }

}