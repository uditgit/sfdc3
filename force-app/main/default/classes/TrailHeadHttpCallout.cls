global class TrailHeadHttpCallout implements Database.Batchable<sObject>, Database.AllowsCallouts{
    
    global final String url = 'https://trailhead.salesforce.com/me/';
    //global final String query = 'SELECT Id, Name, TrailHeadId__c, CurrWeekTHBadges__c, CurrWeekTHPoints__c, CurrMonthTHBadges__c, CurrMonthTHPoints__c FROM Contact WHERE TrailHeadId__c != NULL';
    final String conId = '0037F00001D4IdtQAF';
    global final String query = 'SELECT Id, Name, TrailHeadId__c, CurrWeekTHBadges__c, CurrWeekTHPoints__c, CurrMonthTHBadges__c, CurrMonthTHPoints__c FROM Contact WHERE Id=:conId';
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope){
        String profileUrl;
        Blob body;
        String sBody;
        String badgeCount;
        String points;
        String title;
        List<Contact> lstContactsToUpdate = new List<Contact>();
        List<Contact> lstContacts = (List<Contact>) scope;
        
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        for(Contact con : lstContacts){
            profileUrl = url + con.TrailHeadId__c;
            req.setEndpoint('https://trailhead.salesforce.com/me/sakthivel');
        	req.setMethod('GET');
            HttpResponse res = h.send(req);
            body = res.getBodyAsBlob();
            sBody = body.toString().normalizeSpace();
            badgeCount = sBody.substringBetween('<div class=\'user-information__achievements-data\' data-test-badges-count>', '</div>');
            points = sBody.substringBetween('<div class=\'user-information__achievements-data\' data-test-points-count>', '</div>');
            title = sBody.substringBetween('<title>', '</title>');
            if(null != badgeCount && null != points){
                con.CurrMonthTHBadges__c = Decimal.valueOf(badgeCount.deleteWhitespace());
                con.CurrMonthTHPoints__c = Decimal.valueOf(points.deleteWhitespace().replaceAll(',', ''));
                con.ProfileStatus__c = 'Public Profile';
                lstContactsToUpdate.add(con);
            }
            else{
                if(title.contains('404')){
                    con.ProfileStatus__c = 'Bad Profile';
                    lstContactsToUpdate.add(con);
                }
                if(title.contains('Private')){
                    con.ProfileStatus__c = 'Private Profile';
                    lstContactsToUpdate.add(con);
                }
            }
        }
        if(!lstContactsToUpdate.isEmpty()){
            //update lstContactsToUpdate;
        }
    }
    
    global void finish(Database.BatchableContext BC){
    }
    /*public static String trailHeadHttpCallout(String trailHeadId){
        String url = 'https://trailhead.salesforce.com/me/';
        url = url + trailHeadId;
        
        
        
        //HttpResponse res = h.send(req);
        //Blob body = res.getBodyAsBlob();
        //String sBody = body.toString().normalizeSpace();
        //String badgeCount = sBody.substringBetween('<div class=\'user-information__achievements-data\' data-test-badges-count>', '</div>');
        //String points = sBody.substringBetween('<div class=\'user-information__achievements-data\' data-test-points-count>', '</div>');
        //String title = sBody.substringBetween('<title>', '</title>');
        //System.debug('The title - '+ title);
        //System.debug('The HTML - '+ sBody);
        //System.debug('The badge count - '+ badgeCount);
        //System.debug('The Points - '+ points.deleteWhitespace());
        
        return null;
    }*/

}