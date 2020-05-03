public class DeleteController {
private ApexPages.StandardSetController standardSetController;
    public List<String> accIds{get;set;}
    public String filterId{get;set;}
    
    public DeleteController(ApexPages.StandardSetController standardSetController)
    {
        this.standardSetController = standardSetController;
        filterId = standardSetController.getFilterId();
    }
 
    public PageReference onclick()
    {
        // Apex code for handling records from a List View goes here
        List<Account> selectedListViewRecords = (List<Account>) standardSetController.getSelected();
        if(selectedListViewRecords.size()>0){
            accIds = new List<String>();
            for(Account accRec : selectedListViewRecords){
                accIds.add(accRec.Id);
            }
        }
        return null;
    }
}