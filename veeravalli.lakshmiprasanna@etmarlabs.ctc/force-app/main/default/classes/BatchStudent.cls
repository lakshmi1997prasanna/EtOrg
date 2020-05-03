global class BatchStudent implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC){
        String query = 'SELECT Id,Name,Phone__c,M_Name__c,F_Name__c,Course__c,Email__c FROM Stage__c';
        return Database.getQueryLocator(query);        
    }
    global void execute(Database.BatchableContext BC,List<Stage__c> scope){
        List<Student__c> students = new List<Student__c>();
        for(Stage__c stag : scope){
            try{
            Student__c stu = new Student__c();
            stu.Name = stag.Name;
            stu.Father_Name__c = stag.F_Name__c;
            stu.Mother_Name__c = stag.M_Name__c;
            stu.Parent_ph__c   = stag.Phone__c;
            stu.Parent_E_mail__c = stag.Email__c;
            stu.Course__c = stag.Course__c;
            
                upsert stu Parent_E_mail__c;
            }
            catch(Exception e){
                stag.Description__c = e.getMessage();
                update stag;
            }
        }
       /* DataBase.SaveResult[] sr = Database.insert(students,false);
        for(Database.saveResult srl:sr)
        {
            if(srl.isSuccess())
            {
                system.debug('successfully inserted Student. Id is :'+srl.getId());
            }
            else
            {
                for(DataBase.Error err:srl.getErrors())
                {
                    system.debug('Errors'+err.message);
                    system.debug('Following are the errors');
                    system.debug(err.getStatusCode()+':'+err.getMessage());
                    system.debug('following field affected'+err.getFields());
                    
                }
            }
            
        }*/
    }
    global void finish(Database.BatchableContext BC){
        
    }
    
}