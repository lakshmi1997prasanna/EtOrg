global class batchForAllObj implements Database.Batchable<sObject>,Database.Stateful {
    public string obj;
    public String strParam;
    public String value;
    global batchForAllObj(String objec, String field, String val) {
        obj = objec;
        strParam = field;
        value = val;
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        String query = 'SELECT Id,'+strParam +' '+'FROM '+obj+ ' WHERE CREATEDDATE = THIS_YEAR';
        system.debug(query);
        return Database.getQueryLocator(query); 
    }
    global void execute(Database.BatchableContext BC,List<sObject> scope){
       // Schema.SObjectType t  = Schema.getGlobalDescribe().get(obj);
       // SObject s = t.newSObject();
        for(sObject var : scope){
            var.put(strParam,value);
        }
        update scope;
    }
    global void finish(Database.BatchableContext BC){
        
    }
}