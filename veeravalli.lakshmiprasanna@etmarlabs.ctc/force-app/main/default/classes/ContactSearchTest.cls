@isTest
public class ContactSearchTest {
   @testSetup static void setup(){
     Contact c = new Contact(LastName='sanjana',Email='prassuv.valli@gmail.com');   
       insert c;
    }
    @isTest static void contactEmail(){
        Contact ct = [SELECT Id,Email FROM Contact WHERE Email='prassuv.valli@gmail.com'];
        ContactSearchCtrl con = new ContactSearchCtrl();
        con.emailId = 'prassuv.valli@gmail.com';
        con.searchContactFromEmail();
    }
    @isTest static void testexception(){
        ContactSearchCtrl con = new ContactSearchCtrl();
        con.emailId = 'prasanna@gmail.com';
        con.searchContactFromEmail();
        
    }
}