public class wrapperacc {
     public List<Account> accLst;
   public List<MyWrapper> wrapper1;
    public void wrapperacc(){
        accLst = [select id,Name from Account ORDER BY Name LIMIT 10 ] ;
        
    }
    public class mywrapper{
        public Account id;
        public List<MyWrapper2> wrapper2;
        public mywrapper(){
            wrapper2 = new List<MyWrapper2>();
            
        }
        
    }
    public class MyWrapper2{
        public Account accrec;
        public List<Contact> conrec;
        public List<Opportunity> opprec;
        public  MyWrapper2(Account acc, List<contact> con,List<opportunity> opp){
            accrec = acc;
            conrec = con;
            opprec = opp;
        }
    }
    
}