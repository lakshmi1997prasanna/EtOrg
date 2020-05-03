@isTest
public class DeliveryTest {
    static testMethod void DeliverieState(){
      test.startTest();
      deliverylist dev = new deliverylist();
     Delivery__c del = new Delivery__c();
        dev.getdeliveryStates();
        dev.selectedState = 'Karnataka';
        dev.dosearch();
        dev.AddRow();
        dev.AddRow();
        dev.save();
       
        ApexPages.currentPage().getParameters().put('rowIndex','1');
        dev.deleteRow();
      test.stopTest();  
    }
    
}