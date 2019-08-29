/*({
	doInit : function(component, event, helper) {
		var action=component.get("c.findAll");
        action.setCallback(this, function(a){
           component.set("v.accounts", a.getReturnValue()); 
            window.setTimeout($A.getCallback(function(){
                var event=$A.get("e.c:AccountsLoaded");
                event.setParams({"accounts":a.getReturnValue()});
                event.fire();
            }),500);
            console.log('Action executed');
            console.log(a.getState());
            console.log(JSON.stringify(component.get("v.accounts")));
        });
        $A.enqueueAction(action);
	}
})*/
({
    doInit: function(component, event, helper){
        helper.getAccountList(component);
    },
    deleteAccount: function(component, event, helper){
        event.preventDefault();
        var accountName = event.target.getElementsByClassName('account-name')[0].value;
        confirm('Delete the '+accountName+' account? ');
    }
})