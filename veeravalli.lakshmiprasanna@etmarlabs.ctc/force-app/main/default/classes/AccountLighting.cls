public class AccountLighting {
     @AuraEnabled
    public static List<Account> getAccounts(){
        List<Account> Acc = [SELECT Id,Name,Phone,RichText_Image_test__c FROM Account limit 4];
        return acc;
    }
    @AuraEnabled
    public static List<Account> getdeleteaccid(String recid){
        Account delAcc = [SELECT Id,Name FROM Account WHERE Id=:recid];
        delete delAcc;
        List<Account> remacc = [SELECT Id,Name,Phone FROM Account];
        return remacc;
    }
    @AuraEnabled
    public static Account geteditrecord(String editId){
        Account acc = [select Name,Phone from Account where Id=:editId];
        return acc;
    }
     @AuraEnabled
    public static Account getRelConOpp(String accountid){
        Account Acc = [SELECT Id,Name,Phone,(Select Id,Name,Phone FROM Contacts),(Select Id,Name from Opportunities) From Account where Id=:accountid];
        return Acc;
    }
     @AuraEnabled
    public static List<Contact> getRelCon(String accountid){
        List<Contact> con = [SELECT Id,Name,Phone From Contact where AccountId=:accountid];
        return con;
    }
}