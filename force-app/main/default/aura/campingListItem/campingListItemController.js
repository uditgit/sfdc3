({
	packItem : function(component, event, helper) {
		componet.set("v.item.Packed__c", "true")
        event.getSource().set("v.disabled", "true")
	}
})