public class TestApex {
    public static void testDeleteContact(){
        List<Contact> cList = new List<Contact>();
        Contact c = new Contact(lastName='Test Delete');
        cList.add(c);
        insert cList;
        System.debug(c.Id);
        delete cList;
        System.debug(c.Id);
    }
}