public class RoundRobin {
    public static void updateownerId(Set<Id> ldid ){
        List<Lead> leadList = [Select Id, OwnerId,Lead_Number__c  FROM Lead Where Id IN:ldid];
        System.debug('leadList '+leadList);
        List<User> us = [Select Id,Name From User Where IsActive = true];
        for(Lead ld : leadList){
            if(ld.Lead_Number__c != null){
                Integer  Leadnumber = Integer.valueOf(ld.Lead_Number__c);
                System.debug('#### Leadnumber = '+Leadnumber);
                Integer      userSize = us.size();
                Integer      index = Math.MOD(Leadnumber ,userSize);//+1;
                System.debug('#### index = '+index);
                ld.OwnerId = us[index].Id;
            }
        }
        update leadList;
    }
}