global class batchaAccountupdate implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC){
        String query = 'SELECT Id,Name,AccountNumber FROM Account';
        return Database.getQueryLocator(query);        
    }
    global void execute(Database.BatchableContext BC,List<Account> scope){
        for(Account a : scope){
            a.name = a.Name + '';
            a.AccountNumber = '8907897';
        }
        update scope;
    }
    global void finish(Database.BatchableContext BC){
        
    }

}