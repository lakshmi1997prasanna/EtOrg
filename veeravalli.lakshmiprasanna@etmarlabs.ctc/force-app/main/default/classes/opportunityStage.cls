public class opportunityStage {
    public Static map<String,List<Opportunity>> getAllOppwithStage(){
        map<String,List<Opportunity>> Stageopp = new  map<String,List<Opportunity>>();
        List<Opportunity> oppo = [SELECT Id,StageName FROM Opportunity ORDER BY  StageName DESC];
        for(Opportunity oppst : oppo){
            if(Stageopp.containsKey(oppst.StageName)){
                Stageopp.get(oppst.StageName).add(oppst);
            }
            else{
                List<Opportunity> opplst = new List<Opportunity>();
                opplst.add(oppst);
                Stageopp.put(oppst.StageName,opplst);
            }
        }
       /* for(String m :Stageopp.keyset()){
            system.debug(Stageopp.get(m));
        }*/
        return Stageopp;
    }
}