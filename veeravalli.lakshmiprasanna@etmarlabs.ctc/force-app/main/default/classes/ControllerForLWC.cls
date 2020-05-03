public class ControllerForLWC{
    @AuraEnabled(cacheable=true)
    Public static List<Contact> getContacts(Id accId){
       return [Select Id,Name,Phone from Contact where AccountId =: accId];
    }
}