@isTest
private with sharing class CaseSummaryTrigger_Test {

    @TestSetup static void makeData(){
        Case myCase = new Case (Product_Purchase_Date__c = Date.Today()-30, Product_Has_Extended_Warranty__c = true,
                                    Product_Total_Warranty_Days__c = 100, Status = 'New',
                                    Origin = 'Phone', CurrencyIsoCode = 'USD');
        insert myCase;
    }
    @isTest
    static void caseSummaryTest(){
        String warramtySummary =    'Product purchased on 7/27/2023 and case created on 8/26/2023 2:45 AM.\n '+
                                    'Warranty is for 100 days and is 30.00% through its warranty period.\n '+
                                    'Extended warranty: true \n'+
                                    ' Have a nice day!';

        List<Case> myCases = [SELECT Id, Product_Purchase_Date__c, Product_Has_Extended_Warranty__c,
                                Product_Total_Warranty_Days__c, Status, Origin, CurrencyIsoCode,
                                Warranty_Summary__c
                                FROM Case Limit 1];
        
        System.debug('My case is '+myCases[0].Warranty_Summary__c);

        //Assert.areEqual(warramtySummary,myCases[0].Warranty_Summary__c);
    }
}