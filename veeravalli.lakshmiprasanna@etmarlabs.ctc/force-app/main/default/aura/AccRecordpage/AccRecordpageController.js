({
    doInit : function(component, event, helper) {
        component.set("v.isDetail",true);
        component.set("v.isEdit",false);
        var geteditname = component.get("c.getAccdetail");
        var recordid = component.get("v.recordId");
        geteditname.setParams({
            "targetid": recordid
        });
        geteditname.setCallback(this, function(result){
            component.set("v.contacts", result.getReturnValue());
            var concount = component.get("v.contacts");
           // alert('count'+concount.length)
            if(concount.length > 0){
                component.set("v.isDisplayCon",true);
            }
            
        })
        $A.enqueueAction(geteditname);  
    },
    handleComponentEvent : function(component, event) {
        debugger;
        // Get value from Event
        var accRec = event.getParam('insertCon');
        console.log('accrec'+accRec);
        // Get the List of Existing Account ListOfAcc
        var ListOfAcc = component.get("v.contacts");
        // Add Record in List
        ListOfAcc.push(accRec);
        alert('push')
        console.log('After Push'+ListOfAcc);
        // set the handler attributes based on event data
        component.set("v.contacts", ListOfAcc);
    },
    createContact: function(component, event, helper) {
        helper.insertContact(component, event, helper);
    },
    edit : function(component, event, helper){
        alert('prasanna')
        component.set("v.isDetail",false);
        component.set("v.isEdit",true);
    },
    save : function(component, event, helper) {
        component.find("edit").get("e.recordSave").fire();
        window.location.reload();
        alert('Saved');
    }
})