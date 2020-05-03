public class OppoStage {
    public Static Map<Id,List<Opportunity>> stage(String StageName){
        Map<Id,List<Opportunity>> Stageopp = new Map<Id,List<Opportunity>>();
        List<Opportunity> opp = [SELECT ID,Name,StageName FROM Opportunity WHERE StageName =: StageName];
        for(opportunity oppo : opp){
            List<Opportunity> opplist = new List<Opportunity>();
            if(Stageopp.containskey(oppo.id)){
                Stageopp.get(oppo.id).add(oppo);
            }
            else{
                opplist.add(oppo);
              Stageopp.put(oppo.id,opplist);  
            }
        }
        for(id m : Stageopp.keyset()){           
            system.debug(Stageopp.get(m));
        }
        return Stageopp;
    }
}