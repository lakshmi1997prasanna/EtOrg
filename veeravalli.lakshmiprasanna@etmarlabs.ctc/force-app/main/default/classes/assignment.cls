public class assignment {
    public static Integer method(string s){
        integer index;
        list<string> str = new list<string>();
        str.add('prasanna');
        str.add('lakshmi');
        str.add('rama');
        index = str.indexOf(s);
        
      /*  for(String n : str){
            if(n.contains(s)){
             index = str.indexOf(n);
                system.debug(index);
            }
        } */
        return index;
    }
    public static integer accountCount(){
        integer count = [SELECT count() FROM Account];
        return count;
    }
    public static String getAccountName(String contactname){
    	Contact cont = [SELECT LastName, Account.Name FROM Contact WHERE LastName =: contactname];
        return cont.Account.Name;
    }
    public static void maplist(string s){
        integer i=0;
        map<integer,string> lmap = new map<integer,string>();
        lmap.put(1,'prasanna');
        lmap.put(2,'rama');
        lmap.put(3,'prasanna');  
      //  i = lmap.indexOf(s);
     // set<integer> val1 = lmap.keyset();
      list<integer> val = new list<integer>();
        for(integer var : lmap.keyset()){
            if((lmap.get(var)).equals(s)){
                system.debug(val[i]);               
            }
            i++;
        }
    }
}