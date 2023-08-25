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
        
        if(verifyInsertedCofOrdr.Id!=null){
            System.debug('Inserted Coffee Order has been verified '+verifyInsertedCofOrdr);
        }

        Assert.isTrue(verifyInsertedCofOrdr.Received_Order_Total__c!=null, ASSERTION_MESSAGE);
    }

    @isTest
    static void testUpdate(){
        Coffee_Order__c cofOrdrforUpdate = new Coffee_Order__c(Order_Total__c = null);
        insert cofOrdrforUpdate;
        
        Coffee_Order__c verifyInsertedCofOrdrforUpdate = [SELECT Id, 
        Name, Received_Order_Total__c,  
        Order_Total__c From Coffee_Order__c
        Where Id= :cofOrdrforUpdate.Id];

        if(verifyInsertedCofOrdrforUpdate.Id!=null){
            System.debug('Inserted Coffee Order for Update has been verified '+verifyInsertedCofOrdrforUpdate);
        }

        Assert.isNull(verifyInsertedCofOrdrforUpdate.Received_Order_Total__c,ASSERTION_MESSAGE);

        verifyInsertedCofOrdrforUpdate.Order_Total__c = 25.50;
        update verifyInsertedCofOrdrforUpdate;

        Coffee_Order__c cofOrdrUpdated = [SELECT Id, Name, Received_Order_Total__c,
        Order_Total__c FROM Coffee_Order__c
        WHERE Id =:verifyInsertedCofOrdrforUpdate.Id];

        Assert.isNotNull(verifyInsertedCofOrdrforUpdate.Received_Order_Total__c, ASSERTION_MESSAGE);
    }
}