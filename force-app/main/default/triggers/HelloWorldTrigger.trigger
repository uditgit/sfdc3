trigger HelloWorldTrigger on Account (before insert, after insert, after update) {
    System.debug('New Trigger');
    
    
    if(Trigger.isInsert){
        System.debug('Insert Trigger Fired');
        if(Trigger.isBefore){
            System.debug('Before Trigger Fired');
            for(Account a: Trigger.New){
                a.Description = 'Description set by trigger';
            }
        }
    }
    if(Trigger.isUpdate)
        System.debug('Update Trigger Fired');
}