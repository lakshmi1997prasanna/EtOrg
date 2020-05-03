public class ContactSearchCtrl {
   public String emailId {get ; set;}
    public Contact contactObj {get ; set;}
    public ContactSearchCtrl(){
    }
     public PageReference searchContactFromEmail() {
        try {
         contactObj = [Select Id, Name from Contact where Email =: emailId ];
        } catch(Exception e) {
            ApexPages.addMessages(e);          
        }
         return null;

    }
}