public class NameAndRelatedCont {
    public String name{ get ; set; }
    public List<Contact>  ContObj  { get; set;}
    public NameAndRelatedCont(){
       // ContObj = [SELECT Name FROM Contact WHERE Name LIKE '%ra%']
       ContObj = new List<Contact>();
    }
    public void searchContactFromName(){
         ContObj = new List<Contact>();
      ContObj = [SELECT Id,Name,Account.Id FROM Contact WHERE Name  LIKE : ('%'+name+'%')];
       
    }
    
}