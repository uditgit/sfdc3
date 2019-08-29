({
	handleAddItem : function(component, event, helper) {
        var item = event.getParam("item");
        var action = component.get("c.saveItem");
        action.setParams({
            item: item
        });
        action.setCallback(this, function(response){
            if(response.getState() == "SUCCESS"){
            	var allItems = component.get("v.items");
            	allItems.push(item);
                component.set("v.items", allItems);
            }
            else
                Console.log("Failed with State :"+response.getState());
        });
        $A.enqueueAction(action);
	},
    doInit : function(component, event, helper){
        var action = component.get("c.getItems");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state == "SUCCESS")
                component.set("v.items", response.getReturnValue());
            else
                console.log("Failed with state :"+state);
        });
        $A.enqueueAction(action);
    }
})