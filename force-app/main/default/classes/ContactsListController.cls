public class ContactsListController {
    private String sortOrder = 'LastName';
    public List<Contact> contacts{
        get{
            
            contacts = Database.query('select Id, FirstName, LastName, Title, Email From Contact Order By '+ 
                                      sortOrder +' ASC LIMIT 10');
            return contacts;
        }
        
        private set;
    }
    public void sortByLastName(){
        this.sortOrder = 'LastName';
    }
    public void sortByFirstName(){
        this.sortOrder = 'FirstName';
    }
    
}