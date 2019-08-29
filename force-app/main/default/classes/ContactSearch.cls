public class ContactSearch {
    public static List<Contact> searchForContacts(String lastName, String mailingPostalCode){
        Contact[] listContact = [SELECT ID,Name From Contact WHERE (LastName=:lastName AND 
                                                                   MailingPostalCode=:mailingPostalCode)];
        return listContact;
    }
}