({
	subscribe : function(component, event, helper) {
		const empApi = component.find('empApi');
        const channel = component.get('v.channel');
        const replayId = -1;
        
        const callback = function(message){
            console.log('Event Received - '+ JSON.stringify(message));
            helper.onReceiveNotification(component, message);
        };
        
        empApi.subscribe(channel, replayId, $A.getCallback(callback)).then($A.getCallback(function(newSubscription){
            console.log('Subscribed to channel - '+ channel);
            component.set('v.subscription', newSubscription);
        }));
	},
    
    onReceiveNotification : function(component, message){
        const newMessage = message.data.payload.Message__c;
        const newMessageCreator = message.data.payload.CreatedById;
        const loggedinUser = component.get('v.userId');
        console.log('Created by - '+ newMessageCreator);
        console.log('Logged in User - '+ loggedinUser);
        if(loggedinUser == newMessageCreator){
			component.set('v.message', newMessage);
        }
    }
})