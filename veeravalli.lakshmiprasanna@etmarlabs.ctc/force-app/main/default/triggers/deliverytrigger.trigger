trigger deliverytrigger on Delivery__c (before delete) {
    if(trigger.isbefore && trigger.isdelete){
        TriggerDelivery.DeliveryStatus(Trigger.old);
    }
}