global class batchConprimary implements Database.Batchable<sObject>,Database.Stateful {
    public integer count = 0;
    global Database.QueryLocator start(Database.BatchableContext BC){
        String accounts = 'SELECT Id, (SELECT Id,FirstName,Primary__c FROM Contacts ORDER BY CreatedDate DESC LIMIT 2) FROM Account';
        return Database.getQueryLocator(accounts); 
    }
    global void execute(Database.BatchableContext BC,List<Account> scope){
        List<Contact> conlist = new List<Contact>();
        List<Contact> conlist1 = new List<Contact>();
        for(Account acc : scope){
            if(acc.Contacts.size() > 0){
                conlist.add(acc.Contacts[0]);
            }
            for(Contact con : conlist){
                con.Primary__c =true;
            }
            count++;
        }
        update conlist;
        for(Account acc : scope){
            if(acc.Contacts.size() > 1){
                conlist1.add(acc.Contacts[1]);
            }
            for(Contact con : conlist1){
                con.Primary__c =false;
            }
        }
        update conlist1;
        
    }
    global void finish(Database.BatchableContext BC){
        system.debug(count);
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'prassuv.valli@gmail.com'};
            mail.setToAddresses(toAddresses);
        mail.setSubject('Batch Apex Job is done');
        mail.setPlainTextBody('Total' +'  '+ count +'  '+ 'Records updated sucessfully');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}