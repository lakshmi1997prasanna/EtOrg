({
	myAction : function(component, event, helper) {
        //set action:
        var action = component.get("c.AccQuery");
        //callback action
        var self = this;
        action.setCallback(this,function(response){
            component.set("v.accList",response.getReturnValue())
        });
        $A.enqueueAction(action);
	}
})