global class LeadProcessor implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT Id FROM Lead');
    }
    
    global void execute(Database.BatchableContext bc, List<Lead> lstLeads){
        List<Lead> updLstLeads = new List<Lead>();
        for(Lead ld : lstLeads){
            ld.LeadSource = 'Dreamforce';
            updLstLeads.add(ld);
        }
        update updLstLeads;
    }
    
    global void finish(Database.BatchableContext bc){
        
    }
}