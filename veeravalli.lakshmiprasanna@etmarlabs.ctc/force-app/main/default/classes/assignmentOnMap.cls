public class assignmentOnMap {
    // map<id,Opportunity> opp = new map<id,Opportunity>([SELECT id,Name FROM Opportunity]);
    public static void getlistOfOpportunity(){
        map<id,Opportunity> opp = new map<id,Opportunity>([SELECT id,Name FROM Opportunity]);
         Integer total = 26/5;
        system.debug(total);
        for(id key : opp.keyset()){
            opportunity val = opp.get(key);
            system.debug('id = ' + val.id +'-'+ val.Name);
        }
    }
    public static void getOpportunitiesFromAcc(string accname){
        Opportunity[] oppor = [SELECT id,Name FROM Opportunity where Account.Name =: accname];
        for(Opportunity oppo : oppor){
            //  Opportunity val1 = oppor.get(oppo);
            system.debug(oppo.id +'--' + oppo.Name);
        }        
    } 
    public static void getAllAccountsAndOpp(){
        map<Id,Account> accmap = new map<Id,Account>([SELECT Id,Name,(SELECT Id,Name FROM Opportunities) FROM ACCOUNT]);
        Integer total = accmap.size();
        system.debug(total);
        map<Id,List<Opportunity>> oppmap = new map<Id,List<Opportunity>>();
        for(Id oppo : accmap.keyset()){
            Account a = accmap.get(oppo);
            system.debug(a.Name );
            system.debug(a.opportunities);
        }
    }
    public static void ChildToParent(){
        Contact[] con = [SELECT Id,Name,Account.Name,Account.Phone FROM Contact LIMIT 10];
        for(Contact cont : con){
            system.debug(cont.Id +'==' + cont.Name +'=='+ cont.AccountId);
        }
    }
    public static void accconlist(){
         map<Id,List<Contact>> accountContactMap = new map<Id,List<Contact>>();
        List<Account> lstAccount = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account];
        for(Account acc : lstAccount)
        {
            accountContactMap.put(acc.id, acc.Contacts);
        }
        System.debug(accountContactMap);
    }
}