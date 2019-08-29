public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(string searchString){
        List<List<sObject>> searchList = [FIND :searchString IN NAME FIELDS
                                         RETURNING Contact(Name), Lead(Name)];
        return searchList;
    }
}