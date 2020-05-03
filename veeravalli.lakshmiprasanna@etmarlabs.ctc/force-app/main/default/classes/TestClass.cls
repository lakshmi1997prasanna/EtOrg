public class TestClass {
    public Static void tmethod(){
        Account a = new Account();
        try{
            a.Name = 'spandana';
            a.AccountNumber = '7896546';
            insert a;
        }
        catch(DmlException e){
            system.debug('The following Exception Occour' + e.getMessage());
        }
        
    }
}