trigger OrderEventTrigger on Order_Event__e (after insert) {
	List<Task> tasks = new List<Task>();
    User myUser = [SELECT Id FROM User WHERE Name='Udit Sharma' LIMIT 1];
    
    for(Order_Event__e event : Trigger.New){
        if(event.Has_Shipped__c == true){
            Task ts = new Task();
            ts.Priority = 'Medium';
            ts.Subject = 'Follow up on shipped order '+event.Order_Number__c;
            ts.OwnerId = myUser.Id;
            tasks.add(ts);
        }
    }
    insert tasks;
}