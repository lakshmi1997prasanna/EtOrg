public class TriggerDelivery {
    public static void DeliveryStatus(List<Delivery__c> Deliv){
        for(Delivery__c del : Deliv){
            if(del.Status__c == 'Delivered'){
                del.addError('unable to delete the record');
            }
        }
    }
}