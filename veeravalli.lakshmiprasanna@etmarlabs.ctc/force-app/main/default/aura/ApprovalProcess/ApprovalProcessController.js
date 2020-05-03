({
	doInit : function(component, event, helper) {
		 var geteditname = component.get("c.getAccdetail1");
        var recordid = component.get("v.recordId");
        alert('recordId'+recordid);
        geteditname.setParams({
            "targetid": recordid
        });
        geteditname.setCallback(this, function(result){
            component.set("v.accedit", result.getReturnValue());
            console.log(result.getReturnValue());
            if(result.getReturnValue() == 'Locked'){
                alert('Record is Locked');
            }
            else if(result.getReturnValue() == 'UnLocked'){
                alert('Record is UnLocked');
            }
                else if(result.getReturnValue() == 'Already Locked'){
                   alert('Record is already locked'); 
                }
            else if(result.getReturnValue() == 'approval'){
                   alert('Record is send for approval'); 
                }
             else if(result.getReturnValue() == 'error'){
                   alert('Error in sending approval'); 
                }
        })
        $A.enqueueAction(geteditname);  
	}
})