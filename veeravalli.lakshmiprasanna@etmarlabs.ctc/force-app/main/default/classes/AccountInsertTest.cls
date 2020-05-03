@isTest
public class AccountInsertTest {
    static testMethod void accountinSert(){
        Test.startTest();
        Account acct = new Account();
        acct.Name = 'test';
        acct.AccountNumber = '9876547';
        insert acct;
        Test.stopTest();
    }
    static testMethod void testexception(){
        Test.startTest();
        Account acct = new Account();
        acct.Name = 'test';
        insert acct;
        Test.stopTest();
    }  
}