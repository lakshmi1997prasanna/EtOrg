public class AccountEmail {
    public string email { get; set;}
    public List<Account> accdetail { get; set;}
    public String recid { get ; set ;}
    public List<Contact> conlist {get;set;}
    public AccountEmail(){
       //recid = ApexPages.currentPage().getParameters().get('id');
        contactdetail();
    }
    public void searchforAccount(){ 
        accdetail = [SELECT Id,Name FROM Account WHERE E_mail__c =: email];
    }
     
    
   public pagereference contactdetail(){ 
      // if(recid!=null){
        //    conlist = [select id,Name FROM Contact WHERE AccountId =: recid];
        //}
       pagereference pr = new pagereference('/apex/AccountEmail2?id='+recid);
      //pagereference pr = new pagereference('/apex/AccountEmail2'+recid);
       pr.setRedirect(true);
        return pr;     
   }
}