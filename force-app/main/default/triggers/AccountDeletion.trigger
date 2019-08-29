trigger AccountDeletion on Account (before delete) {
	for(Account a : [SELECT Id FROM Account
                    WHERE Id IN (SELECT AccountId FROM Opportunity) AND
                     Id IN : Trigger.Old]){
                         Trigger.oldMap.get(a.Id).addError('Cannot Delete account with related opportunities');
                     }
}