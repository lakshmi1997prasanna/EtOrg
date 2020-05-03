public class ParentOfWrapper 
{
    public List<WrapperAccountDelete> accdel {get;set;}
   public ParentOfWrapper()
   {    
           accdel = new List<WrapperAccountDelete>();
     
       List<Account> acc = new List<Account>([SELECT Name FROM Account order By Name]);
        for(account a1: acc)
        {
            WrapperAccountDelete w=new WrapperAccountDelete();
            w.checked=false;
            w.a=a1;
            accdel.add(w);           
        }
     }
    
    
    public class WrapperAccountDelete
    {
            public account a {get ; set;}
         public Boolean checked {get ; set ;}
             
    }
    
    
  public PageReference del()
  {
        List<Account> listfordel = new List<Account>();
        List<WrapperAccountDelete> listundel = new List<WrapperAccountDelete>();
        for(WrapperAccountDelete w : accdel){
            if(w.checked==true){
                listfordel.add(w.a);
            }
            else{
                listundel.add(w);
            }
        }    
      delete listfordel;
    PageReference pageRef = new PageReference(ApexPages.currentPage().getUrl());

   pageRef.setRedirect(true);
  return pageRef;

  }
}