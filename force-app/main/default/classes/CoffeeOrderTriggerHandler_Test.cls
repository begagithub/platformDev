@isTest(isParallel = true)
public without sharing class CoffeeOrderTriggerHandler_Test {
    
    public static final String ASSERTION_MESSAGE = 'DateTime should populate with the now datetime';

    @isTest
    static void testInsert(){
        Coffee_Order__c cofOrdr = new Coffee_Order__c(Order_Total__c = 10.00);
        insert cofOrdr;
        
        Coffee_Order__c verifyInsertedCofOrdr = [SELECT Id, 
        Name, Received_Order_Total__c,  
        Order_Total__c From Coffee_Order__c
        Where Id= :cofOrdr.Id];
        
        if(verifyInsertedCofOrdr!=null){
            System.debug('Inserted Coffee Order has been verified '+verifyInsertedCofOrdr);
        }

        Assert.isTrue(verifyInsertedCofOrdr.Received_Order_Total__c!=null, ASSERTION_MESSAGE);
    }
}