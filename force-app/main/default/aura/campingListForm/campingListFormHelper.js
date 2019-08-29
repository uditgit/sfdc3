({
		createItem : function(component, newItem) {
        /*var action = component.get("c.saveItem");
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
        $A.enqueueAction(action);*/
            var addItem = component.getEvent("addItem");
            addItem.setParams({
                "item" :newItem
            });
            component.set("v.newItem",{'sobjectType': 'Camping_Item__c',
                             'Quantity__c': 0,
                             'Price__c': 0
                             });
            addItem.fire();
	}	
})