public class AccConWrapper {
    public List<WrapperAccountContact> acccon {get;set;}
    public List<WrapperAccountContact> lstSetController {get;set;}
    CustomIterable obj;
    public Integer pagenum{get;set;}
    public Integer totalpages {get ; set;}
    public Integer totalAccCon;
    public Boolean showHide { get ; set;}
    public Integer index { get ;set;}
    
    public AccConWrapper(){
        showHide=false;
        pagenum=0;
        acccon = new List<WrapperAccountContact>();
        lstSetController = new List<WrapperAccountContact>();
        List<Account> acc = new List<Account>([SELECT Id,Name FROM Account order By Name]);
        system.debug(acc);
        List<Contact> con = new List<Contact>([SELECT Id,Phone,Primary__c,AccountId FROM Contact WHERE Primary__c = true]);
        for(Account a1: acc)
        {
            for(Contact c1 : con){
                if(a1.Id==c1.AccountId){
                    WrapperAccountContact w=new WrapperAccountContact();
                    w.checked=false;
                    w.a=a1;
                    w.c=c1;    
                    acccon.add(w);
                }
            }
        }
        Decimal pages = Decimal.valueOf(acccon.size());
        pages = pages.divide(Decimal.valueOf(5), 2);
        totalPages = (Integer)pages.round(System.RoundingMode.CEILING);
        /* totalAccCon = (acccon.size())/5;
system.debug(totalAccCon);
totalpages = totalAccCon;*/
        system.debug(acccon);
        obj = new CustomIterable (acccon); 
        obj.setPageSize = 5;
        next();  
    }
    public Boolean hasNext {
        get 
        {
            return obj.hasNext();
        }
        set;
    }
    
    public Boolean hasPrevious {
        get 
        {
            return obj.hasPrevious();
        }
        set;
    }
    
    public void next() 
    {
        lstSetController = obj.next();
        pagenum++;
    }
    
    public void previous() 
    {
        lstSetController = obj.previous();
        pagenum--;
    }
    /* public class WrapperAccountContact
{
public account a {get ; set;}
public contact c {get ; set;}
public Boolean checked {get ; set ;}

}*/
    public Pagereference cancel(){
        PageReference pageRef = new PageReference(ApexPages.currentPage().getUrl());
        pageRef.setRedirect(true);
        return pageRef;
    }
    public PageReference Save()
    {
        List<Contact> listupdate = new List<Contact>();
        List<WrapperAccountContact> unselected = new List<WrapperAccountContact>();
        for(WrapperAccountContact w : acccon){
            if(w.checked==true){
                listupdate.add(w.c);
            }
            else{
                unselected.add(w);
            }
        } 
        if(listupdate.size()>0){
            update listupdate;
            PageReference pageRef = new PageReference(ApexPages.currentPage().getUrl());
            pageRef.setRedirect(true);
            return pageRef;
        }
        else{
            ApexPages.Message msg = new Apexpages.Message(ApexPages.Severity.Warning,'Select atleast one record' );
            ApexPages.addmessage(msg);
        }
        return null;
    }
    /* public void  showPhoneField(){

WrapperAccountContact items=(WrapperAccountContact)lstSetController.get(index);
System.debug('items'+items);
if(items.checked==true){

}*/
    
    
}