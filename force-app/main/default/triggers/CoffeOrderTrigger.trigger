trigger CoffeOrderTrigger on Coffee_Order__c (before insert, before update, after insert, after update){
    CoffeOrderTriggerHandler coffeeorderTrigHandler = new CoffeOrderTriggerHandler(Trigger.New, Trigger.Old);
    coffeeorderTrigHandler.run();
}