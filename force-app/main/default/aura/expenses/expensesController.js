({
	doInit : function(component, event, helper){
        var action = component.get("c.getExpenses");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state=="SUCCESS")
                component.set("v.expenses", response.getReturnValue());
            else
                console.log("Failed with State: "+state);
        });
        $A.enqueueAction(action);
    },
    clickCreate : function(component, event, helper) {
        var validExpense = component.find("expenseform").reduce(function(validSoFar, inputCmp){
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        },true)
        if(validExpense){
            var newExpense = component.get("v.newExpense");
            console.log("Create Expense: "+ JSON.stringify(newExpense));
            helper.createExpense(component, newExpense);
        }
	},
    handleUpdateExpense : function(component, event, helper){
        var updatedExpense = event.getParam("expense");
        helper.updateExpense(component, updatedExpense);
    }
})