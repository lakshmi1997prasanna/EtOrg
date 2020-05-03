({ 
    /* AccNotifierController */
    onRecordSubmit : function(cmp , event) {
        /* var cmpEvent = cmp.getEvent("cmpAccEvent");
        var value = cmp.find("form1");
        alert('value'+value);
        cmpEvent.setParams( { "insertCon" : value } );
        alert('Event');
        cmpEvent.fire(); */
    },
    createContact : function(component,event){
        debugger;
        var contact = component.get("v.contact");
        var accrecordId = component.get("v.recid");
        var toastEvent = $A.get('e.force:showToast');
        var createAction = component.get('c.createContactRecord');
        createAction.setParams({
            newContact: contact,
            accId : accrecordId
        });
        createAction.setCallback(this, function(response) {           
            var state = response.getState();
            if(state === 'SUCCESS') {
                var dataMap = response.getReturnValue();
                var cmpEvent = component.getEvent("cmpAccEvent");
                var value = dataMap;
                alert('value'+value);
                cmpEvent.setParams( { "insertCon" : value } );
                alert('Event');
                cmpEvent.fire();
                /*if(dataMap.status=='success') {
                    toastEvent.setParams({
                        'title': 'Success!',
                        'type': 'success',
                        'mode': 'dismissable',
                        'message': dataMap.message
                    });
                    var cmpEvent = component.getEvent("cmpAccEvent");
                    var value = dataMap;
                    alert('value'+value);
                    cmpEvent.setParams( { "insertCon" : value } );
                    alert('Event');
                    cmpEvent.fire();
                    toastEvent.fire();            
                    window.location.reload();
                } 
                else if(dataMap.status=='error') {
                    toastEvent.setParams({
                        'title': 'Error!',
                        'type': 'error',
                        'mode': 'dismissable',
                        'message': dataMap.message
                    });
                    toastEvent.fire();                
                }
            } else {
                alert('Error in getting data');
            }*/
            }
        });
        // Adding the action variable to the global action queue
        $A.enqueueAction(createAction);
    },
    handleSuccess1 : function(component, event, helper){
        
    },
    createLead : function(component, event, helper) {
        debugger;
        var createRecordEvent = $A.get("e.force:createRecord");
        createRecordEvent.setParams({
            "entityApiName": "Contact"
        });
        createRecordEvent.fire();
    }
})