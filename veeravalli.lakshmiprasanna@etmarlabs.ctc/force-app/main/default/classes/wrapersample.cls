public class wrapersample {
    public static void getdetails(){
         List<wrapperfirst> w = new  List<wrapperfirst>();
       List<Account> acc = new List<Account>();
        acc = [SELECT id,Name FROM Account];
        List<Contact> cont = new List<Contact>();
         cont = [SELECT Id,Accountid,Name FROM Contact];
        map<id,List<Contact>> mapcont = new  map<id,List<Contact>>();
        for(Contact con : cont){
            List<Contact> c = new List<Contact>();
            if(mapcont.containsKey(con.Accountid)){
                mapcont.get(con.Accountid).add(con);
            }
            else{
                c.add(con);
            }
            mapcont.put(con.Accountid,c);
        }
        List<Opportunity> opp = new  List<Opportunity>();
        opp = [SELECT Id,Name,Accountid FROM Opportunity];
        map<id,List<Opportunity>> mapopp = new map<id,List<Opportunity>>();
        for(Opportunity oppo : opp){
            List<Opportunity> o = new List<Opportunity>();
            if(mapopp.containsKey(oppo.Accountid)){
                mapopp.get(oppo.Accountid).add(oppo);
            }
            else{
                o.add(oppo);
            }
            mapopp.put(oppo.Accountid,o);
        }
        for(Account a : acc){     
             wrapper2 w2 = new wrapper2();
            if(mapcont.containsKey(a.id)){
                w2.con1 = mapcont.get(a.id);
            }
            if(mapopp.containsKey(a.id)){
                w2.opp1 = mapopp.get(a.id);
            }
            w2.accName = a.name;      
        wrapperfirst w1 = new wrapperfirst();            
        w1.accountid = a.id;
        w1.acc = a;
        w1.wrap2 = w2;
            w.add(w1);            
        }  
        system.debug(w);
    }  
    
    public class wrapperfirst{   
    public id accountid;
    public account acc;
    public wrapper2 wrap2;
}
    public class wrapper2{
        public List<Contact> con1;
        public List<Opportunity> opp1;
        public String accname;
    }
}