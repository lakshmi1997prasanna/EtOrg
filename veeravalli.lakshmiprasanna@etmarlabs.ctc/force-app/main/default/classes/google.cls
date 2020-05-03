public class google {

     public string recid{get;set;}

   public string row{ get; set;}
   public list<Account> Acclst{get;set;}
   Public Account A;

   public List<Contact> contacts {get; set;}

   public google(){

   Acclst = [select Id,Name from Account ];
   contacts=null;
   }

  

  public void setupContacts()
  {
     contacts=[select id, FirstName, LastName from Contact where AccountId=:recId];
      }
}