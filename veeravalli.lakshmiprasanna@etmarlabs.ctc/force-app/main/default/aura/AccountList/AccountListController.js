({
    doInit : function(component, event, helper) {
        var getAccts = component.get("c.getAccounts");
        getAccts.setCallback(this, function(result){
            var details = result.getReturnValue();
            component.set("v.account", details);
        })
        $A.enqueueAction(getAccts);
    },
    edit : function(component, event, helper) {
        debugger;
        component.set("v.isEdit",true);
        console.log('Edit record ID..'+event.target.id);
        //component.set("v.editAccId",event.target.id);
        var editrecordid = event.target.id;
        var geteditname = component.get("c.geteditrecord");
        geteditname.setParams({
            "editId": editrecordid  
        });
        geteditname.setCallback(this, function(result){
            component.set("v.accedit", result.getReturnValue());
        })
        $A.enqueueAction(geteditname);     
    }
    ,
    
    onSubmit  : function(component, event, helper) {
        var eventFields = event.getParam("fields");
        var field = 'Name';
        var field = 'Phone';
        
        //$A.get('e.force:refreshView').fire();
        location.reload();
    },
    delete : function(component, event, helper){
    debugger;
    var delaccid = event.target.id;
    var getdelacc = component.get("c.getdeleteaccid");
    getdelacc.setParams({
    "recid": delaccid
});
getdelacc.setCallback(this, function(result){
    component.set("v.account", result.getReturnValue());
})
$A.enqueueAction(getdelacc);                     
}

})