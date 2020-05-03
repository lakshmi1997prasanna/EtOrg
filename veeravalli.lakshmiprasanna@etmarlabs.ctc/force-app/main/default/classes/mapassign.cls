public class mapassign {
    public static  Map<Id,List<Opportunity>> getOpportunitiesFromAcc(String accountName){
        Map<Id,List<Opportunity>> accountOppMap = new Map<Id,List<Opportunity>>();
        List<Opportunity> oppo = [SELECT Name,Account.Name,AccountId FROM Opportunity WHERE Account.Name =: accountName];
        for(Opportunity opp : oppo){
            //
            //List<Opportunity> opplst = new List<Opportunity>();//accountOppMap.get(opp.AccountId);
            //opplst.add(opp);
            if(accountOppMap.Containskey(opp.AccountId)){
                accountOppMap.get(opp.accountId).add(opp);
            }
            else{
                List<Opportunity> opplst = new List<Opportunity>();
                opplst.add(opp);
                accountOppMap.put(opp.accountId,opplst);
            }
            // accountOppMap.put(opp.accountId,opplst);
        }
        return accountOppMap;
    }
}