({
	doInit : function(component, event, helper) {
		var myDate = component.get("v.expense.Date__c");
        if(myDate)
            component.set("v.formatdate", new Date(myDate));
	},
    clickReimbursed : function(component, event, helper){
        var expense = component.get("v.expense");
        var updateEvent = component.getEvent("updateExpense");
        updateEvent.setParams({
            "expense":expense
        });
        updateEvent.fire();
    }
})