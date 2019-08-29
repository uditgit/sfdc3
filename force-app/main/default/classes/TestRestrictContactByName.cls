@isTest
private class TestRestrictContactByName {
	@isTest
    static void LastNameIsINVALIDNAME(){
        Contact newContact = new Contact(LastName='INVALIDNAME');
        Test.startTest();
        Database.SaveResult result = Database.insert(newContact, false);
        Test.stopTest();
        System.assert(result.getErrors().size()>0);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML', result.getErrors()[0].getMessage());
    }
    
    @isTest
    static void LastNameIsNotINVALIDNAME(){
        Contact newContact = new Contact(LastName='Test Contact Trigger');
        Test.startTest();
        Database.SaveResult result = Database.insert(newContact);
        Test.stopTest();
        System.assert(result.getErrors().size()==0);
    }
}