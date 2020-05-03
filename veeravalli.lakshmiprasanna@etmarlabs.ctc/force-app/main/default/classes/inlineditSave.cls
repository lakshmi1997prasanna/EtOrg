public class inlineditSave {
@AuraEnabled
    public static List < account > fetchAccount() {
        
        List < Account > returnList = new List < Account > ();
        List < Account > lstOfAccount = [select Name from account];
        
        for (Account acc: lstOfAccount) {
            returnList.add(acc);
        }
        return returnList;
    }
    
    @AuraEnabled
    public static List < account > saveAccount(List<Account> lstAccount) {
        System.debug('Entered method'+lstAccount);
        update lstAccount;
        return lstAccount;
    }
}