public class pdfconvert {
    public List<Account> accountlist { get ; set ;}
    public pdfconvert(){
        accountlist = [SELECT ID,Name,Phone FROM Account];
    }
}