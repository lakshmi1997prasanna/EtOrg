public class deliverylist {
    public string selectedState{ get ; set ;}
    public List<Delivery__c> deliList{ get ; set ;}
     public Integer rowIndex {get;set;}

    public deliverylist(){
        deliList = new List<Delivery__c>();
    }

    public  List<SelectOption> getdeliveryStates() {
        List<SelectOption> options = new List<SelectOption>();
        
        Schema.DescribeFieldResult fieldResult = Delivery__c.State__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        
        for( Schema.PicklistEntry f : ple) {
            options.add(new SelectOption(f.getLabel(), f.getValue()));
        }       
        
        return options;
    }
    
    
    public void dosearch() {
        
        deliList = [Select Name,City__c,Country__c,Delivery_Date__c,State__c,Zip_Code__c,Status__c,Delivery__c from Delivery__c Where State__c =: selectedState ]; //change according to your criteria
        
    }
    
    
    public PageReference AddRow()
    {
        deliList.add(new Delivery__c(id=null));
        return null;
    }
    
    
    public PageReference save(){
        try{
            upsert deliList;
        }
        catch(Exception e){
            ApexPages.addMessages(e); 
        }
        return null;             
    } 
    
   public void deleteRow(){
 
 rowIndex = Integer.valueOf(ApexPages.currentPage().getParameters().get('rowIndex'));
  System.debug('row be deleted ' + rowIndex );
 System.debug('row to be deleted '+ deliList[rowIndex]);     
 deliList.remove(rowIndex);
 
 
 }
}