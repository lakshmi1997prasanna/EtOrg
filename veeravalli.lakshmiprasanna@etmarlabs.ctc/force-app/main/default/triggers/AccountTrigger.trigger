trigger AccountTrigger on Account (before insert,before update) {
    if(Trigger.isBefore && (Trigger.isinsert || Trigger.isupdate)){
        //AccountTrigger.fieldvalidation(Trigger.new);
        //AccountTrigger.getTimeZone(Trigger.new);
    }
    if(Trigger.isafter && (Trigger.isinsert || Trigger.isupdate)){
        //AccountTrigger.getTimeZone(Trigger.new);
    }
/*if(trigger.isinsert){
list<contact> clist=new list<contact>();
for(account acc:trigger.new){
     Contact c = new Contact(LastName=acc.name+' prasanna',
                             AccountId=acc.id,                           
                             MailingStreet='maruthiNagar',
                             MailingCity='bangalore',
                             MailingCountry='India');
     clist.add(c);                        
    
}
 insert clist;

}
if(trigger.isafter && trigger.isupdate){
 AccountTrigger.accountafterupdate(trigger.newMap,trigger.oldMap);
 }*/
}