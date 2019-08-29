public class CampingListController {
	@AuraEnabled
    public static List<Camping_Item__c> getItems(){
        System.debug('Get Executed');
        return [SELECT Name, Price__c, Quantity__c, Packed__c From Camping_Item__c];
    }
    
    @AuraEnabled
    public static Camping_Item__c saveItem(Camping_Item__c item){
        System.debug('Save Executed');
        upsert item;
        return item;
    }
}