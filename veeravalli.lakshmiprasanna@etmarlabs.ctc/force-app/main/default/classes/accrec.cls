public class accrec {
    @AuraEnabled
    public static List<Contact> getAccdetail(String targetid){
        //Account acc = [select Name,Phone,(select id, name,Phone from Contacts) from Account where Id=: targetid];
        List<Contact> con = [Select Id,Name ,Phone From Contact Where AccountId =: targetid];
        System.debug('contacts'+con);
        return con;
    }
    @AuraEnabled
    public static List<Contact> createContactRecord(Contact newContact,Id accId) {
        System.debug('newContact'+newContact);
        List<Contact> contactlist = new List<Contact>();
        List<Contact> contactlistreturn = new List<Contact>();
        List<Id> contactSuc = new List<Id>();
        newContact.AccountId = accId;
        contactlist.add(newContact);
        Database.DMLOptions dml = new Database.DMLOptions();
        Database.SaveResult[] srList = Database.insert(contactlist, dml);
        for (Database.SaveResult sr: srList) {
            if (sr.isSuccess()) {
                contactSuc.add(sr.Id);
            } 
            else {
            }
        }
        if(contactSuc.size()>0){
            contactlistreturn = [Select Id,Name,Phone From Contact Where Id IN :contactSuc];
        }
        return contactlistreturn;
    }
    @AuraEnabled
    public static String getAccdetail1(String targetid){
        String success;
        List<Account> acc1 = new List<Account>();
        Account acc = [Select Id,Name,Status__c from Account Where Id=: targetid];
        acc1.add(acc);
        //Boolean result = Approval.isLocked(targetid);
        //System.debug('result-- '+result);
        if(acc.Status__c == 'New' && Approval.isLocked(targetid) == false){
            Approval.LockResult[] lrList = Approval.lock(acc1, false);
            for(Approval.LockResult lr : lrList) {
                if (lr.isSuccess()) {
                    System.debug('Successfully locked account with ID: ' + lr.getId());
                    success = 'Locked';
                }
                else {
                    success = 'UnLocked';
                }
            }
        }
        else if(Approval.isLocked(targetid) == true){
            success = 'Already Locked';
        }
        else if (acc.Status__c != 'New' && Approval.isLocked(targetid) == false){
            try{
            Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();
            req1.setObjectId(acc.Id);
            req1.setSkipEntryCriteria(true);
            
            // Submit the approval request for the account
            Approval.ProcessResult result = Approval.process(req1);
              success = 'approval';  
            }
            Catch(Exception e){
                success = 'error';
                System.debug('error  '+e.getMessage());
            }
        }
        return success;
    }
}