({
    doInit : function(component, event, helper) {
        var accId = component.get("v.AccIdSet");
        var action = component.get("c.permissiontodel");
        
        action.setCallback(this, function(data) {
            
            if(data.getState() == "SUCCESS"){
                
                if(data.getReturnValue() == true){
                    
                    if(accId!=null && accId!=""){
                        component.set("v.loadingScreen", false);
                        component.set("v.isDelete", true);
                    }
                }
            }
        });
        $A.enqueueAction(action);
    },
    deleteAcc : function(component, event, helper){
         var accId = component.get("v.AccIdSet");
        var action = component.get("c.deleterec");

        action.setParams({
            "accIdString": component.get("v.AccIdSet")
        });

    	action.setCallback(this, function(data) {
        	if(data.getState() == "SUCCESS"){
        		
                if(data.getReturnValue() == true){
                    component.set("v.isDelete", false);
                    component.set("v.loadingScreen", false);
            	}
            	else{
                    component.set("v.isDelete", false);
            		component.set("v.loadingScreen", false);
            	
            	}
    }
        });
        $A.enqueueAction(action);
    },
    closePopUp : function(component, event, helper) {
        
        window.location.href = $A.get("https://veeravalli-lakshmi-dev-ed.my.salesforce.com")+"/lightning/o/Account/list?filterName="+component.get("v.filterIdVal");
    }
})