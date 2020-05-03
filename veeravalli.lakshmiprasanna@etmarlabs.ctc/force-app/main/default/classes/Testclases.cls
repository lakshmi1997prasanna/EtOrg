@isTest
public class Testclases {
 @isTest
    public Static void testriyaz(){
         
        Account acc = new Account();
        acc.Name = 'Riyaz';
        acc.Phone = '9876543210';
        insert acc;
        
         Contact con  = new Contact();
        con.AccountId = acc.Id;
        con.LastName = 'lakshmi';
        con.Phone = '9876543212';
        insert con;
        
        test.startTest();
        accrec.getAccdetail(acc.id);
        accrec.getAccdetail1(acc.id);
        accrec.createContactRecord(con);
        test.stopTest();
    }
    @isTest
    public Static void testriyaz1(){
         
        Account acc = new Account();
        acc.Name = 'Riyaz';
        acc.Phone = '9876543210';
        acc.Status__c = 'Old';
        insert acc;
        
         Contact con  = new Contact();
        con.AccountId = acc.Id;
        con.LastName = 'lakshmi';
        con.Phone = '9876543212';
        insert con;
        
        test.startTest();
        accrec.getAccdetail1(acc.id);
        test.stopTest();
    }
}