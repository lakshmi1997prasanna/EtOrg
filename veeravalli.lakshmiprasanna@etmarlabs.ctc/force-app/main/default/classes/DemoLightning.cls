public class DemoLightning {
 @AuraEnabled
    public static list<Account> AccQuery(){
        return [select Name,Phone from Account];
    }
}