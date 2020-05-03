public class AccountEmail2 {

    public String recid { get ; set ;}
    public List<Contact> conlist {get;set;}
    public AccountEmail2(){
        recid = ApexPages.currentPage().getParameters().get('id');
         if(recid!=null){
           conlist = [select id,Name FROM Contact WHERE AccountId =: recid];
        }
    }
   
}