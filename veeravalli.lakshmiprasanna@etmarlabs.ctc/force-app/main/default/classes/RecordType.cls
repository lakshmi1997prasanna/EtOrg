public class RecordType {
    Public static Id recordTypeId(string obj,string recName){
        Id recTypeId;
        if(obj!= null && recName != null){
            recTypeId= Schema.getGlobalDescribe().get(obj).getDescribe().getRecordTypeInfosByName().get(recName).getRecordTypeId();
        }  
        return recTypeId;  
     }
}