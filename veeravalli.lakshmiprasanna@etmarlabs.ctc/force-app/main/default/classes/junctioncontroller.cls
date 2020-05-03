public class junctioncontroller {
    public string name{ get ; set ;}
    public  List<Category__c> categorylist{ get ; set ;}
    public List<Wrappercategory> wrappercat {get;set;}
    public junctioncontroller(ApexPages.StandardController controller){
        
    }
    public void searchpositionfromname() {
        categorylist = new List<Category__c>();
        wrappercat = new List<Wrappercategory>();
        categorylist = [Select Id, Name from Category__c where Name LIKE : ('%'+name+'%') ];
        for(Category__c a1 : categorylist)
        {
            Wrappercategory w = new Wrappercategory();
            w.checked = false;
            w.c = a1;
            wrappercat.add(w);           
        }    
    }
    public class Wrappercategory
    {
        public Category__c c {get ; set;}
        public Boolean checked {get ; set ;}
        
    }
    
    public pagereference Addtojnobj()
    {
        List<Category__c> listforadd = new List<Category__c>();
        List<jnobj__c> jn = new List<jnobj__c>();
        for(Wrappercategory w : wrappercat){
            if(w.checked==true){
                listforadd.add(w.c);
                String LeadId  =  apexpages.currentpage().getparameters().get('id');
                jnobj__c l = new jnobj__c();
                l.Name = w.c.Name;
                l.leadRel__c = LeadId;
                l.categoryRel__c = w.c.id;
                jn.add(l); 
                
            } 
           
        }            
    
    upsert jn;
    delete listforadd;
    
    PageReference pageRef = new PageReference(ApexPages.currentPage().getUrl());
    
    pageRef.setRedirect(true);
    return pageRef;
}

}