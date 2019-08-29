public class DailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext context){
        List<Lead> lstLeads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource='' LIMIT 200];
        for(Lead l : lstLeads){
            l.LeadSource = 'Dreamforce';
        }
        update lstLeads;
    }
}