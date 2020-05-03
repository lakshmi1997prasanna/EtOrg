public class AccountAndContact {
    public List<Account> accountlist { get ; set ;}
    public List<Contact> contactlist { get ; set ;}
    public AccountAndContact(){
              /* accountlist = [SELECT Id,Name FROM Account];
               contactlist = [SELECT FirstName,LastName FROM Contact]; */
    } 
   /* public void accountlist(){
        accountlist = [SELECT Id,Name FROM Account];
    }
    public void contactlist(){
        contactlist = [SELECT Name FROM Contact];
    } */
    public void refresh(){
         accountlist = [SELECT Id,Name FROM Account];
               contactlist = [SELECT FirstName,LastName FROM Contact];
    } 
}