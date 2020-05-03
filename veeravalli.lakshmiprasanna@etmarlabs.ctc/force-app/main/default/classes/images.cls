public class images {
 public pagereference footer()
    {
        pagereference p=new pagereference('https://www.flipkart.com');
        p.setRedirect(true);
        return p;
    }
     public pagereference header()
    {
        pagereference p=new pagereference('https://www.google.com');
        p.setRedirect(true);
        return p;
    }
     public pagereference sidebar()
    {
        pagereference p=new pagereference('https://www.facebook.com/prasanna.lakshmi.16');
        p.setRedirect(true);
        return p;
    }
}