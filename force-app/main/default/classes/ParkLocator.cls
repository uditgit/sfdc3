global class ParkLocator {
    
    @AuraEnabled
    global static String[] result {get;set;}
    @AuraEnabled
    public static String[] country(String country){
        ParkService.ParksImplPort parks = new ParkService.ParksImplPort();
        Notification__e notify = new Notification__e(Message__c = (parks.byCountry(country))[0]);
        EventBus.publish(notify);
        return parks.byCountry(country);
    }
    
    @RemoteAction
    global static Continuation parkLocator(String country){
        AsyncParkService.byCountryResponseFuture responseFuture = new AsyncParkService.byCountryResponseFuture();
        Integer TIMEOUT_INT_SECS = 60; 
        Continuation cont = new Continuation(TIMEOUT_INT_SECS);
        cont.continuationMethod = 'processResponse';
        AsyncParkService.AsyncParksImplPort park = new AsyncParkService.AsyncParksImplPort();
        responseFuture = park.beginByCountry(cont, country);
        cont.state = responseFuture;
        return cont;
    }
    
    global static Object processResponse(Object state){
        AsyncParkService.byCountryResponseFuture responseFuture = (AsyncParkService.byCountryResponseFuture)state;
        result = responseFuture.getValue();
        return result;
    }
    
    @RemoteAction
    global static String fireNotificationEvent(String result){
        System.debug('Result - '+ result);
        List<Notification__e> notifications = new List<Notification__e>();
        Notification__e notify = new Notification__e(Message__c = result);
        notifications.add(notify);
        List<Database.SaveResult> results = EventBus.publish(notifications);
        for(Database.SaveResult sr : results){
            if(sr.isSuccess()){
                System.debug('Successfully published event - ');
            }
            else{
                for(Database.Error err : sr.getErrors()){
                    System.debug('Error returned - '+ err.getStatusCode() +'- '+ err.getMessage());
                }
            }
        }
        return 'Done';
    }
    
    @AuraEnabled
    public static String getUserId(){
        return UserInfo.getUserId();
    }
}