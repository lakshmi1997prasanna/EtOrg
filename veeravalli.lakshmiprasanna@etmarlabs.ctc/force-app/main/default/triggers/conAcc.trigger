trigger conAcc on Contact (before insert) {
if(trigger.isbefore&&trigger.isinsert){
//conaccph.conaccphmethod(Trigger.New);
 Contact  ct = new Contact();
  for(Contact con : Trigger.new){
    ct = [Select Id,Name From Contact Where AccountId =:con.AccountId and Primary__c=true];
    ct.Primary__c = false;
    con.Primary__c = true;
  }
  update ct;
}
}