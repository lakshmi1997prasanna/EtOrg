@isTest
public class BatchAccountUpdateTest {
    @isTest static void AccountUpdate(){
        List<Account> acc = new List<Account>();
        for(Integer i=0;i<200;i++){
            Account a = new Account(Name='Acc'+i);
            acc.add(a);
        }
      insert acc;       
        test.startTest();
       batchaAccountupdate acct = new batchaAccountupdate();
       Database.executeBatch(acct);
        test.stopTest();
    }
}