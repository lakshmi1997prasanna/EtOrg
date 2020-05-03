public class conaccph {
    public static void conaccphmethod(List<Contact> con){
        set<id> accid = new set<id>();
        for(Contact c : con){
            if(c.AccountId!=null){
                accid.add(c.AccountId);
                system.debug(accid);
            }
        }
        Map<id,Account> acc = new map<id,Account>([SELECT ID,Phone FROM Account WHERE ID IN :accid]);
        system.debug(acc);
        for(Contact ct : con){
            if(acc.Containskey(ct.AccountId)){
                ct.OtherPhone=acc.get(ct.AccountId).Phone;
            }
        }
    }
}