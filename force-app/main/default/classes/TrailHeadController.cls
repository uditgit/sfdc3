public class TrailHeadController {
    
    private List<Contact> lstContacts;
    private List<Contact> lstWeekCons;
    private List<Contact> lstMonthCons;
    
    public TrailHeadController(){
        lstContacts = new List<Contact>();
        lstWeekCons = new List<Contact>();
        lstMonthCons = new List<Contact>();
    }
    
    public List<Contact> getListOfContacts(){
        lstContacts = [SELECT Name, TotalTHBadges__c, TotalTHPoints__c FROM Contact WHERE TrailHeadId__c != NULL ORDER BY TotalTHBadges__c DESC NULLS LAST];
        return lstContacts;
    }
    
    public List<Contact> getListOfWeeklyChampions(){
        List<Contact> lstCons = new List<Contact>();
        lstCons = [SELECT Name, WeeklyBadgeDiff__c, WeeklyPointDiff__c FROM Contact WHERE TrailHeadId__c != NULL AND WeeklyBadgeDiff__c != 0 ORDER BY WeeklyBadgeDiff__c DESC];
        if(!lstCons.isEmpty()){
            lstWeekCons.add(lstCons[0]);
            for(Integer i = 1; i<lstCons.size(); i++){
                if(lstWeekCons[0].WeeklyBadgeDiff__c > lstCons[i].WeeklyBadgeDiff__c){
                    break;
                }
                else{
                    if(lstWeekCons[0].WeeklyBadgeDiff__c == lstCons[i].WeeklyBadgeDiff__c){
                        lstWeekCons.add(lstCons[i]);
                    }
                }
            }
        }
        return lstWeekCons;
    }
    
    public List<Contact> getListOfMonthlyChampions(){
        List<Contact> lstCons = new List<Contact>();
        lstCons = [SELECT Name, MonthlyBadgeDiff__c, MonthlyPointDiff__c FROM Contact WHERE TrailHeadId__c != NULL AND MonthlyBadgeDiff__c != 0 ORDER BY MonthlyBadgeDiff__c DESC];
        if(!lstCons.isEmpty()){
            lstMonthCons.add(lstCons[0]);
            for(Integer i = 1; i<lstCons.size(); i++){
                if(lstMonthCons[0].MonthlyBadgeDiff__c > lstCons[i].MonthlyBadgeDiff__c){
                    break;
                }
                else{
                    if(lstMonthCons[0].MonthlyBadgeDiff__c == lstCons[i].MonthlyBadgeDiff__c){
                        lstMonthCons.add(lstCons[i]);
                    }
                }
            }
        }
        return lstMonthCons;
    }
    
}