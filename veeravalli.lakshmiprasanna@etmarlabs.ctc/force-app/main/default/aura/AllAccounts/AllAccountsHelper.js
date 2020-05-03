({
   getAccounts: function(component, page, recordToDisply) {
 
      // create a server side action. 
      var action = component.get("c.fetchAccount");
      // set the parameters to method 
      action.setParams({
         "pageNumber": page,
         "recordToDisply": recordToDisply
      });
      // set a call back   
      action.setCallback(this, function(a) {
         // store the response return value (wrapper class insatance)  
         var result = a.getReturnValue();
         console.log('result ---->' + JSON.stringify(result));
         // set the component attributes value with wrapper class properties.   
 
         component.set("v.Accounts", result.accounts);
         component.set("v.page", result.page);
         component.set("v.total", result.total);
         component.set("v.pages", Math.ceil(result.total / recordToDisply));
 
      });
      // enqueue the action 
      $A.enqueueAction(action);
   },
    deleteAccount : function(component, event) {
        console.log('in delete account helper method.');
        console.log(event.target.id);
        var action = component.get("c.getdeleteaccid");
        console.log(event.target.id);
        action.setParams({"acid":event.target.id});
        action.setCallback(this, function(response) {
        	component.set("v.Accounts",response.getReturnValue());
        	console.log(response.getReturnValue());
        });
       
        $A.enqueueAction(action);
        location.reload();
	},
    SearchHelper: function(component, event) {
        debugger;
        // show spinner message
        console.log('helper');
         component.find("Id_spinner").set("v.class" , 'slds-show');
        var searchField = component.find('searchField').get("v.value");
        console.log('search '+searchField);
        var action = component.get("c.searchAccount");
        action.setParams({
            'searchKeyWord': searchField
        });
        action.setCallback(this, function(response) {
           // hide spinner when response coming from server 
            component.find("Id_spinner").set("v.class" , 'slds-hide');
            var state = response.getState();
            
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
                component.set("v.showsearchresult",true);
                // if storeResponse size is 0 ,display no record found message on screen.
                if (storeResponse.length == 0) {
                    component.set("v.Message", true);
                } else {
                    component.set("v.Message", false);
                }
                
                // set numberOfRecord attribute value with length of return value from server
                component.set("v.TotalNumberOfRecord", storeResponse.length);
                
                // set searchResult list with return value from server.
                component.set("v.Accounts", storeResponse); 
                
            }else if (state === "INCOMPLETE") {
                alert('Response is Incompleted');
            }else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        alert("Error message: " + 
                                    errors[0].message);
                    }
                } else {
                    alert("Unknown error");
                }
            }
        });
        $A.enqueueAction(action);
    },
  
	 MAX_FILE_SIZE: 4500000, //Max file size 4.5 MB 
    CHUNK_SIZE: 750000,      //Chunk Max size 750Kb 
    
    uploadHelper: function(component, event) {
        debugger;  
        // start/show the loading spinner   
        component.set("v.showLoadingSpinner", true);
        // get the selected files using aura:id [return array of files]
        var fileInput = component.find("fileId").get("v.files");
        // get the first file using array index[0]  
        var file = fileInput[0];
        var self = this;
        // check the selected file size, if select file size greter then MAX_FILE_SIZE,
        // then show a alert msg to user,hide the loading spinner and return from function  
        if (file.size > self.MAX_FILE_SIZE) {
            component.set("v.showLoadingSpinner", false);
            component.set("v.fileName", 'Alert : File size cannot exceed ' + self.MAX_FILE_SIZE + ' bytes.\n' + ' Selected file size: ' + file.size);
            return;
        }
 
        // create a FileReader object 
        var objFileReader = new FileReader();
        // set onload function of FileReader object   
        objFileReader.onload = $A.getCallback(function() {
            var fileContents = objFileReader.result;
            var base64 = 'base64,';
            var dataStart = fileContents.indexOf(base64) + base64.length;
 
            fileContents = fileContents.substring(dataStart);
            // call the uploadProcess method 
            self.uploadProcess(component, file, fileContents);
           
        });
 
        objFileReader.readAsDataURL(file);
    },
 
    uploadProcess: function(component, file, fileContents) {
        // set a default size or startpostiton as 0 
        var startPosition = 0;
        // calculate the end size or endPostion using Math.min() function which is return the min. value   
        var endPosition = Math.min(fileContents.length, startPosition + this.CHUNK_SIZE);
 
        // start with the initial chunk, and set the attachId(last parameter)is null in begin
        this.uploadInChunk(component, file, fileContents, startPosition, endPosition, '');
    },
 
 
    uploadInChunk: function(component, file, fileContents, startPosition, endPosition, attachId) {
        // call the apex method 'saveChunk'
        debugger;
        var getchunk = fileContents.substring(startPosition, endPosition);
        var action = component.get("c.saveChunk");
        var test =  component.get("v.editAccId");
        console.log('test'+test);
        action.setParams({
            parentId: component.get("v.editAccId"),
            fileName: file.name,
            base64Data: encodeURIComponent(getchunk),
            contentType: file.type,
            fileId: attachId
        });
 
        // set call back 
        action.setCallback(this, function(response) {
            // store the response / Attachment Id   
            debugger;
            attachId = response.getReturnValue();
            var state = response.getState();
            console.log('state'+state);
            if (state === "SUCCESS") {
                // update the start position with end postion
                startPosition = endPosition;
                endPosition = Math.min(fileContents.length, startPosition + this.CHUNK_SIZE);
                // check if the start postion is still less then end postion 
                // then call again 'uploadInChunk' method , 
                // else, diaply alert msg and hide the loading spinner
                alert('your File is uploaded successfully'+response.getReturnValue());
                if (startPosition < endPosition) {
                    this.uploadInChunk(component, file, fileContents, startPosition, endPosition, attachId);
                } else {
                    alert('your File is uploaded successfully'+response.getReturnValue());
                    component.set("v.showLoadingSpinner", false);
                }
                // handel the response errors        
            } 
             else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
        // enqueue the action
        debugger;
        $A.enqueueAction(action);
        location.reload();
    },
    shiftDiv: function(component, event,lWidth) {
        var changeposition = component.get("v.intervalId");
        var floatElement = document.getElementById('tofloat');	  
        if(changeposition < lWidth){
            floatElement.style.left = changeposition+'px';
            changeposition = changeposition + 5;
            component.set("v.intervalId",changeposition);
        }
        //reset the left to 0
        else{
            component.set("v.intervalId",0);
            floatElement.style.left = "0px";
            changeposition = component.get("v.intervalId");//resetting so as to hit the if block again
        }
    }
});