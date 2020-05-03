({
	doInit : function(component, event, helper) {
        var recid = component.get("v.recordId");
		var action = component.get("c.getRelCon");
        action.setParams({
            accountid : component.get("v.recordId")
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                component.set("v.listAppDocCat",result);
            }
        });
        $A.enqueueAction(action);

	},
    
    handleUploadFinished: function (cmp, event) {
        // This will contain the List of File uploaded data and status
        //var uploadedFiles = event.getParam("files");
       //var uploadedFiles = event.getParam("files");
        alert("Files uploaded  ");
    }
})