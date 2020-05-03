public class CallingFunctions{
  public void methodA(){
   system.debug('insite A');
   Account acc = new Account();
       acc.Name = 'lakshmi';
       acc.AccountNumber = '1234567';
       insert acc;
   methodB('prasanna',20,acc,Date.Today());
   }
  public void methodB(string s,integer a,Account acc,Date dt){
  system.debug('name and age is' +s +a +acc +dt);
  } 
}