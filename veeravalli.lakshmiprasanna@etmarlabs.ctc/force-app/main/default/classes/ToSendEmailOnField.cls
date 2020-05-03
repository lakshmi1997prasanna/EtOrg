global class ToSendEmailOnField implements Database.Batchable<sObject> {
    List<Account> acc = new List<Account>();
      global Database.QueryLocator start(Database.BatchableContext BC){
          Date dt = Date.Today().addDays(-1);
        String query = 'Select Id,Name,Status__c,SLAExpirationDate__c From Account Where SLAExpirationDate__c <= dt';
        return Database.getQueryLocator(query);        
    }
    global void execute(Database.BatchableContext BC,List<Account> scope){
        if(scope.size()> 0){
            for(Account AC : scope){
                acc.add(AC);
                System.debug('Account'+acc);
            }
            
        }
    }
    global void finish(Database.BatchableContext BC){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        List<String> toAddresses = new List<String>();
        System.debug('AccountFinish'+acc);
        for(Account acc1 : acc){
            toAddresses.add(acc1.E_mail__c);
        }
        
            mail.setToAddresses(toAddresses);
        mail.setSubject('Batch Apex Job is done');
        mail.setPlainTextBody('Field is not updated from last 5 days');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
    
}