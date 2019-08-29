public class TestDml {
    public static void testLimitInsert(){
        Account acc = new Account(name='MyAccount');
        insert acc;
        
        for(Integer i=0;i<150;i++){
            Account newAcc = new Account(Name='MyAccount'+i);
            try{
                insert newAcc;
            }
            catch(Exception e){
                System.debug('Exception logged - '+e);
            }
        }
        insert new Account(Name='MyAccoun');
    }
    public static void testSingleInsert(){
        Opportunity newOpp = new Opportunity(Name='Test Oppo');
        try{
            insert newOpp;
        }
        catch(Exception e){
            System.debug('Caught-'+e);
        }
        Contact newCon = new Contact(LastName='My NEw Con');
        insert newCon;
    }
    private class myinner1{
        /*private class myinner2{
            
        }*/
    }
    public static void insertTestObj(){
        Test_Obj1__c newObj = new Test_Obj1__c(Name='MyFirstObj');
        insert newObj;
    }
    
    public static void testSavepoint(){
        Contact con = new Contact(LastName='TestSavepoint');
        insert con;
        Savepoint sp = Database.setSavepoint();
        Opportunity oppo = new Opportunity(Name='MyTestOppo');
        try{
        insert oppo;
        }
        catch(Exception e){
            Database.rollback(sp);
        }
        
    }
    
    public static void testException(){
        try{
            List<String> nameList;
            Account a;
            String s = a.Name;
            nameList.add(s);
        }
        catch(ListException e){
            System.debug('List Exception');
        }
        catch(NullPointerException e){
            System.debug('Null Exception');
        }
        catch(Exception e){
            System.debug('Generic Exception');
        }
    }
    
    public static void testDescribe(){
        System.debug('Fields1- '+Schema.getGlobalDescribe().get('Account').getDescribe().fields.getMap());
        System.debug('Fields2- '+Schema.SObjectType.Account.fields.getMap());
    }
    
    public static void testEmptyChildSoql(){
        List<Account> lstAccs = [SELECT Id,(SELECT Name FROM Contacts) FROM Account WHERE Id='0017F00000kjjNWQAY'];
        System.debug('Child-'+lstAccs[0]);
        System.debug('Child2-'+lstAccs[0].Contacts);
    }
    
    public static void testObjectName(){
        Id accId = '0017F00000kjjNWQAY';
        System.debug('Object Name-'+accId.getSobjectType().getDescribe().getName());
    }
}