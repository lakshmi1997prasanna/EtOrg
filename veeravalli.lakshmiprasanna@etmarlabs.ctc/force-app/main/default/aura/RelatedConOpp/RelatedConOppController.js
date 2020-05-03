({
    doInit : function(component, event, helper) {
        var geteditname = component.get("c.getAccounts");
        geteditname.setCallback(this, function(result){
            component.set("v.Account", result.getReturnValue());
        })
        $A.enqueueAction(geteditname);  
    },
    edit : function(component, event, helper){
        component.set("v.edit",false);
        component.set("v.save",false);
        // component.set("v.edit",false);
        
    },
    onCheckboxChange : function(component, event, helper) {
        component.set("v.isedit",true);
        component.set("v.createcontact",false);
        component.set("v.createoppo",false);
        //Gets the checkbox group based on the checkbox id
        var availableCheckboxes = component.find('rowSelectionCheckboxId');
        var resetCheckboxValue  = false;
        if (Array.isArray(availableCheckboxes)) {
            //If more than one checkbox available then individually resets each checkbox
            availableCheckboxes.forEach(function(checkbox) {
                checkbox.set('v.value', resetCheckboxValue);
            }); 
        } else {
            //if only one checkbox available then it will be unchecked
            availableCheckboxes.set('v.value', resetCheckboxValue);
        }
        //mark the current checkbox selection as checked
        event.getSource().set("v.value",true);
            var acc = event.getSource().get("v.text");
        component.set("v.accid",acc);
        component.set("v.selectedid",acc);
        var getrelcon = component.get("c.getRelConOpp");
        getrelcon.setParams({
            "accountid": acc
            
        });
        getrelcon.setCallback(this, function(result){
            component.set("v.accedit", result.getReturnValue());
            console.log('relatedContact '+ result.getReturnValue());
        })
        $A.enqueueAction(getrelcon);  
    },
    new : function(component, event, helper){
    component.set("v.createcontact",true);
    var accidvalue = component.get("v.selectedid");
    component.set("v.acctid",accidvalue);
    component.set("v.createoppo",false); 
    
},
 refresh : function(component, event, helper){
    $A.get("e.force:refreshView").fire();
}
})