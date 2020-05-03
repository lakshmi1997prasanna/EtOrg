public class AccountTrigger {
    public Static void accountafterupdate(Map<id,Account> newMapAcc , Map<Id,Account> oldMapAcc){
        
        List<Contact> conrec = new List<Contact>();
        set<id> AccId = new set<Id>();
        
        
        for(Account accNew : newMapAcc.values())
        {
            if(oldMapAcc.containsKey(accNew.Id)){
                Account accold = oldMapAcc.get(accNew.Id);
                if(accold.Status__c == 'New' && accold.Status__c != accNew.Status__c){
                    AccId.add(accNew.Id);
                }
            }
            
        }
        if(AccId.size()>0){
            conrec = [Select id, Phone,AccountId from Contact where AccountId IN : AccId];
        }
        if(conrec.size()>0){
            for(Contact con : conrec){
                con.phone = '9999999999';
            }
            update conrec;
        }
        
    }
    public Static void fieldvalidation(List<Account> newlist){
        for(Account acc : newlist){
            String field = acc.Name.substring(0,1);
            if(!(field.isAlpha())){
                acc.Name.addError('Must start with Alpha');
            }
        }
    } 
    
    public Static void getTimeZone(List<Account> newlist){
        for(Account acc : newlist){
            if(acc.BillingCountryCode == 'IN' || acc.BillingCountryCode == 'US' ){
                if(acc.BillingStateCode != ''){
                    System.debug('BillingStateCode'+acc.BillingStateCode);
                    System.debug('BillingState'+acc.BillingState);
                    String getzoneState = getZoneByState(acc.BillingStateCode);
                    acc.TimeZone__c = getzoneState;
                }
            }
            else{
                String getzoneCountry = getZoneByCountry(acc.BillingCountry);
                    acc.TimeZone__c = getzoneCountry;
            }
        }
        
    }
    public Static String getZoneByState(String StateCode){
        TimeZone__c tz = [Select Name,State__c,TimeZone__c,Country__c From TimeZone__c Where State__c =: StateCode];
        if(tz.TimeZone__c != ''){
            return tz.TimeZone__c;
        }
        else
            return 'No matching timeZones';
    }
    
    public Static String getZoneByCountry(String CountryCode){
        TimeZone__c tz = [Select Name,State__c,TimeZone__c,Country__c From TimeZone__c Where Country__c =: CountryCode];
        if(tz.TimeZone__c != ''){
            return tz.TimeZone__c;
        }
        else
            return 'No matching timeZones';
    }
    
   /* public Static void getTimeZone(List<Account> newlist){
        String apiKey = 'AIzaSyAuxVmx79n9-C2ivKveS1qYWIkxfW8NZls';
        List<Account> acclist = new List<Account>();
        for(Account acc : newlist){
            if(acc.BillingLatitude != null && acc.BillingLongitude != null){
           HttpResponse resbody  =   Timezone.gettimezomelatlan(acc.BillingLatitude,acc.BillingLongitude);
            
            if(resbody != null){
              Account acc2 = new Account();
                    acc2.Id = acc.Id;
                    acc2.TimeZone__c = resbody.getBody();
                    acclist.add(acc2);
            }
          }
        }
        update acclist;
    } */
}