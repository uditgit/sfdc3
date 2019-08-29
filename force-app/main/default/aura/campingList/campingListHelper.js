({
	/*createItem : function(component, newItem) {
        var action = component.get("c.saveItem");
        action.setParams({
            item: newItem
        });
        action.setCallback(this, function(response){
            if(response.getState() == "SUCCESS"){
            	var allItems = component.get("v.items");
            	allItems.push(newItem);
                component.set("v.items", newItem);
            }
            else
                Console.log("Failed with State :"+response.getState());
        });
        $A.enqueueAction(action);
	},*/    
})