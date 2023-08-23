public with sharing class CoffeOrderTriggerHandler {
    
    public List<Coffee_Order__c> newCoffeeOrders;
    public List<Coffee_Order__c> oldCoffeeOrders;

    public CoffeOrderTriggerHandler() {}

    public CoffeOrderTriggerHandler(List<Coffee_Order__c> newCofOrdrs, List<Coffee_Order__c> oldCofOrdrs){
        this.newCoffeeOrders = newCofOrdrs;
        this.oldCoffeeOrders = oldCofOrdrs;
    }

    public void run(){

        if(Trigger.isAfter!=null && Trigger.isAfter){
            return;
        }

        List<Coffee_Order__c> coffeeOrders = this.newCoffeeOrders;
        for(Integer i=0; i < coffeeOrders.size(); i++){
            Coffee_Order__c co = this.newCoffeeOrders[i];
            Coffee_Order__c oldco = this.oldCoffeeOrders == null ? null : this.oldCoffeeOrders[i];
            co = this.receivedOrderTotal(co, oldco);
        }
    }

    public Coffee_Order__c receivedOrderTotal(Coffee_Order__c newCO, Coffee_Order__c oldCO){
        if(oldCO == null){
            oldCO = new Coffee_Order__c();
        }
        if(newCO.Received_Order_Total__c == null && newCO.Order_Total__c!=null && oldCO.Order_Total__c==null){
            newCO.Received_Order_Total__c=Datetime.now();
        } 

        return newCO;
    }

}