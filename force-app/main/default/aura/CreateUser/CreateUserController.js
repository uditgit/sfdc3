({
	updateNickname : function(component, event, helper) {
        if(event.getParams().keyCode==9){
            var nameInput = component.find("name");
            var nameValue = nameInput.get("v.value");
            var nickname = component.find("nickname");
            var today = new Date();
            nickname.set("v.value", nameValue+today.valueOf(today));
        }		
	},
    saveUserForm : function(component, event, helper){
        var name = component.get("v.user.name");
        var password = component.get("v.user.password__c");
        var email = component.get("v.user.email__c");
        var nickname = component.get("v.user.nickname__c");
        
        var passwordCmp = component.find("userPassword");
        var emailCmp = component.find("userEmail");
        
        helper.validatePassword(component,event, helper);
        helper.validateEmail(component, event, helper);
        
        if(passwordCmp.get("v.errors") == null && emailCmp.get("v.errors") == null){
            component.set("v.hasErrors", false);
            helper.save(component, name, password, email, nickname);
        }
        else{
            component.set("v.hasErrors", true);
        }
    },
    cancel : function (component, event, helper){
        $A.get("e.force:closeQuickAction").fire();
    }
})