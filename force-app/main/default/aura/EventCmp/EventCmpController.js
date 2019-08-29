({
	onInit : function(component, event, helper) {
		component.set('v.subscription', null);
        const empApi = component.find('empApi');
        const errorHandler = function(message){
            console.error('Received error - '+ JSON.stringify(message));
        };
        empApi.onError($A.getCallback(errorHandler));
        helper.subscribe(component, event, helper);
        var action=component.get('c.getUserId');
        action.setCallback(this, function(response){
            var state = response.getState();
            console.log('User Id state-'+ state);
            if(state === 'SUCCESS'){
                component.set('v.userId', response.getReturnValue());
                console.log('User id set - '+ response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	},
    
    handleClick : function(component, event, helper){
        console.log('Handle click');
        //var action = component.get('c.addAsync');
        //var action = component.get('c.parkLocator');
        /*var action = component.get('c.country');
        action.setParams({
            country : 'India'
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            console.log('State-'+ state);
            var response = response.getReturnValue();
            console.log('Response - '+ response);
        });
        $A.enqueueAction(action);*/
        var message = 'India';
        var vfOrigin = 'https://' + component.get('v.vfHost');
        console.log('Origin - '+ vfOrigin);
        var vfWindow = component.find('vfFrame').getElement().contentWindow;
        vfWindow.postMessage(message, vfOrigin);
    }
})