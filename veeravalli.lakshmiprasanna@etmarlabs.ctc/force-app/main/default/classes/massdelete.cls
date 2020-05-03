public class massdelete {
 @AuraEnabled
    public static Boolean permissiontodel(){
    User userinfo = [Select id,ProfileId,Profile.Name from User where id=:UserInfo.getUserId()];
        if(userinfo.ProfileId == '00e6F000002nwrDQAQ'){
            return true;
        }
        else
            return false;
    }
   @AuraEnabled
    public Static Boolean deleterec(String accIdString){
         accIdString = accIdString.replaceAll('[+.\\[\\]()-]','').replaceAll(' ','');
        List<String> accIdList = accIdString.split(',');
        List<Account> accList = new List<Account>();

        try{
            //get case Ids to delete
            accList = [Select id from Account where id=: accIdString];
            delete accList;
            return true;
        }
        catch(Exception e){
            return false;
        }
    }
}