public  with sharing class AccountDrop {
    public String selectedrecid{ get ; set ;}
    public List<Contact> relcontact {get;set;}
    public AccountDrop(){
        
    }
    public List<selectOption> getselectedlist(){
        List<Account> acc = [SELECT Id,Name FROM Account];
        List<selectOption> optionlist = new List<selectOption>();
        optionlist.add(new selectOption( ' ' ,'---Select---'));
        for(Account ac : acc){
            optionlist.add(new selectOption(ac.id , ac.Name));
        }
        return optionlist;
    }
    public pagereference getrelcon(){
        system.debug(selectedrecid);
        relcontact = [SELECT Id,Name,accountid FROM Contact WHERE accountid=:selectedrecid];
        
        system.debug(relcontact);
        return null;
    }
}