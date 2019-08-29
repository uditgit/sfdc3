({
	clickCreateItem : function(component, event, helper) {
        var validItem = component.find("campingListform").reduce(function(validSoFar,inputCmp){
             inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        },true);
        if(validItem){
            var newItem = component.get("v.newItem");
            console.log("Create Item: "+ JSON.stringify(newItem));
            helper.createItem(component, newItem);
            //var theItem = component.get("v.items");
            //theItem.push(newItem);
            //component.set("v.items", theItem);
        }
        /*component.set("v.newItem",{'sobjectType': 'Camping_Item__c',
                             'Quantity__c': 0,
                             'Price__c': 0
                             });*/
	}
})