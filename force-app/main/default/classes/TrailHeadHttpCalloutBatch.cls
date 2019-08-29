global class TrailHeadHttpCalloutBatch implements Database.Batchable<sObject>, Database.AllowsCallouts{
    
    global final String url = 'https://trailhead.salesforce.com/me/';
    global final String query = 'SELECT Id, Name, TrailHeadId__c, CurrWeekTHBadges__c, CurrWeekTHPoints__c, CurrMonthTHBadges__c, CurrMonthTHPoints__c FROM Contact WHERE TrailHeadId__c != NULL';
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope){
        String profileUrl;
        Blob body;
        String sBody;
        String badgeCount;
        String points;
        List<Contact> lstContactsToUpdate = new List<Contact>();
        List<Contact> lstContacts = (List<Contact>) scope;
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        for(Contact con : lstContacts){
            profileUrl = url + con.TrailHeadId__c;
            req.setEndpoint(profileUrl);
            req.setMethod('GET');
            HttpResponse res = h.send(req);
            body = res.getBodyAsBlob();
            sBody = body.toString().normalizeSpace();
            badgeCount = sBody.substringBetween('<div class=\'user-information__achievements-data\' data-test-badges-count>', '</div>');
            points = sBody.substringBetween('<div class=\'user-information__achievements-data\' data-test-points-count>', '</div>');
            System.debug('The badge Count - '+ badgeCount);
            System.debug('The points - '+ points);
            if(null != badgeCount && null != points){
                if(System.Date.today() == System.Date.today().toStartOfMonth()){
                    con.PrevMonthTHBadges__c = con.CurrMonthTHBadges__c;
                    con.PrevMonthTHPoints__c = con.CurrMonthTHPoints__c;
                    con.CurrMonthTHBadges__c = Decimal.valueOf(badgeCount.deleteWhitespace());
                    con.CurrMonthTHPoints__c = Decimal.valueOf(points.deleteWhitespace().replaceAll(',', ''));
                    con.TotalTHBadges__c = con.CurrMonthTHBadges__c;
                    con.TotalTHPoints__c = con.CurrMonthTHPoints__c;
                }
                if(System.Date.today() == System.Date.today().toStartOfWeek().addDays(1)){
                    con.PrevWeekTHBadges__c = con.CurrWeekTHBadges__c;
                    con.PrevWeekTHPoints__c = con.CurrWeekTHPoints__c;
                    con.CurrWeekTHBadges__c = Decimal.valueOf(badgeCount.deleteWhitespace());
                    con.CurrWeekTHPoints__c = Decimal.valueOf(points.deleteWhitespace().replaceAll(',', ''));
                    con.TotalTHBadges__c = con.CurrWeekTHBadges__c;
                    con.TotalTHPoints__c = con.CurrWeekTHPoints__c;
                }
                lstContactsToUpdate.add(con);
            }
        }
        update lstContactsToUpdate;
        
        
    }
    
    global void finish(Database.BatchableContext BC){
        List<EmailTemplate> lstTemplates = [SELECT Id FROM  EmailTemplate WHERE DeveloperName = 'TrailHeadList' LIMIT 1];        
        List<Contact> lstContacts = [SELECT Email FROM Contact WHERE Name='Udit Sharma'];
        List<String> emailToList = new List<String>();
        emailToList.add(lstContacts[0].Email);
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(emailToList);
        mail.setTargetObjectId(lstContacts[0].Id);
        mail.setTemplateId(lstTemplates[0].Id);
        List<Messaging.Email> lstEmails = new List<Messaging.Email>();
        lstEmails.add(mail);
        Messaging.sendEmail(lstEmails);
        
    }
}