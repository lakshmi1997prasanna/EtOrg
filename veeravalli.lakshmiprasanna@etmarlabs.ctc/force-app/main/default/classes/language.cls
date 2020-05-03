public class language {
    public String  language1 { get ; set ;}
    public List<Assignment__c> assignmentlist { get ; set ;}
    
    public language(){
        assignmentlist = new List<Assignment__c>();
    }
    public List<SelectOption> getassignlan(){
       List<SelectOption > options = new List<SelectOption>();
        
        Schema.DescribeFieldResult fieldResult = Assignment__c.Languagesknown__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        
        for( Schema.PicklistEntry f : ple) {
            options.add(new SelectOption(f.getLabel(), f.getValue()));
        }       
        
        return options; 
    }
  
    
    
    public void dosearch(){
       String allselected;
        string[] PicklistValue = language1.split(','); 
        for(String picklist : PicklistValue){
            
            allselected  =  allselected + '\''+picklist+'\';'; 
        }
        string s = 'SELECT Id,Languagesknown__c FROM Assignment__c WHERE  Languagesknown__c IN  ('+allselected+')';
        system.debug(s);
        system.debug(allselected);
          assignmentlist = [SELECT Name,Languagesknown__c FROM Assignment__c WHERE  Languagesknown__c IN ('+allselected+')];
    }
    
}