({
    doInit: function(component, event, helper) {
        // this function call on the component load first time     
        // get the page Number if it's not define, take 1 as default
        var page = component.get("v.page") || 1;
        // get the select option (drop-down) values.   
        var recordToDisply = component.find("recordSize").get("v.value");
        // call the helper function   
        helper.getAccounts(component, page, recordToDisply);
        
        //For scrolling
        var lWidth = window.innerWidth ;//Get the window's width
        //The setInterval() method calls a function or 
        //evaluates an expression at specified intervals (in milliseconds).
        window.setInterval($A.getCallback(function() { 
            helper.shiftDiv(component, event,lWidth);
        } ), 100);
    },
    
    navigate: function(component, event, helper) {
        // this function call on click on the previous page button  
        var page = component.get("v.page") || 1;
        // get the previous button label  
        var direction = event.getSource().get("v.label");
        // get the select option (drop-down) values.  
        var recordToDisply = component.find("recordSize").get("v.value");
        // set the current page,(using ternary operator.)  
        page = direction === "Previous Page" ? (page - 1) : (page + 1);
        // call the helper function
        helper.getAccounts(component, page, recordToDisply);
        
    },
    
    onSelectChange: function(component, event, helper) {
        // this function call on the select opetion change,     
        var page = 1
        var recordToDisply = component.find("recordSize").get("v.value");
        helper.getAccounts(component, page, recordToDisply);
    },
    edit : function(component, event, helper) {
        debugger;
        component.set("v.isEdit",true);
        console.log('Edit record ID..'+event.target.id);
        component.set("v.editAccId",event.target.id);
    },
    closeModel:function(component,event,helper){    
        component.set("v.isEdit",false);
    },
    
    delete: function(component, event, helper) {
    console.log('@@@!!!');
    component.set("v.editAccId",event.target.id);
    var acc =  event.target.id;
    console.log(acc);
    var acon = component.get("c.ContactById");
    acon.setParams({"accid": acc});
acon.setCallback(this, function(result){
    //    component.set("v.accCount",result.getReturnValue());
    console.log('@@@@'+result.getReturnValue());
    if(result.getReturnValue() > 0){
        component.set("v.isConfirm",true);
    }
    else{
        confirm("Are you want to delete account");
        helper.deleteAccount(component, event);   
    }
})
$A.enqueueAction(acon);

}  ,
    cancelDel: function(component, event, helper) {
        component.set("v.isConfirm",false);
    },
        Confirm: function(component, event, helper) {
            console.log('confirm');
            helper.deleteAccount(component, event);  
            
        },
            onSubmit  : function(component, event, helper) {
                var eventFields = event.getParam("fields");
                var field = 'Name';
                var field = 'Phone';
                
                //$A.get('e.force:refreshView').fire();
                location.reload();
            },
                doSave: function(component, event, helper) {
                    if (component.find("fileId").get("v.files").length > 0) {
                        helper.uploadHelper(component, event);
                    } else {
                        alert('Please Select a Valid File');
                    }
                },
                    
                    handleFilesChange: function(component, event, helper) {
                        var fileName = 'No File Selected..';
                        if (event.getSource().get("v.files").length > 0) {
                            fileName = event.getSource().get("v.files")[0]['name'];
                        }
                        component.set("v.fileName", fileName);
                    },
     Search: function(component, event, helper) {
         debugger;
        var searchField = component.find('searchField').get("v.value");
         console.log('searchfield '+searchField);
       // var isValueMissing = searchField.get('v.validity').valueMissing;
         // value is missing show error message and focus on field
        /*if(isValueMissing) {
            searchField.showHelpMessageIfInvalid();
            searchField.focus();
        }else{
          // else call helper function */
          console.log('testing search');
         if(searchField==""){
             debugger;
           //location.reload(); 
             var page = component.get("v.page") || 1;
        // get the select option (drop-down) values.   
        var recordToDisply = component.find("recordSize").get("v.value");
           helper.getAccounts(component, page, recordToDisply); 
         }
         else{
            helper.SearchHelper(component, event);
         }
        }
})