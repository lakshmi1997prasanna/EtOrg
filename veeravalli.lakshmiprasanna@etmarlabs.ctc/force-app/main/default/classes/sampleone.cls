public class sampleone {
    public sampleone(){}
   /* public void gel(){
      Contact cont = new Contact();
        cont.Lastname='srujana';
        cont.MailingStreet='Maruthi Nagar';
        cont.MailingCity='Bangalore';
        cont.MailingCountry='India';
        insert cont;
        gell(cont);
    } */
    public static void gell(){
       // system.debug(cont);
    List <String> slist = New list<String>();
    slist.add('prasanna');
    slist.add('lakshmi');
    slist.add('rama');
    slist.add('sam');
        System.debug(slist);
      Contact cont = [Select id,lastname from Contact where Lastname='srujana'];
        
    }
}