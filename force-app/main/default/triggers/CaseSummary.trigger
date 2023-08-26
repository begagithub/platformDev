trigger CaseSummary on Case (before insert, before update, after insert, after update) {
    if(Trigger.isInsert && Trigger.isBefore) {
        for(Case cs: Trigger.New){
            Date purchaseDate = cs.Product_Purchase_Date__c;
            Integer noOfDays = purchaseDate.daysBetween(Date.Today());   //(Date.today()-purchaseDate);
            Decimal daysPercent;
            if(cs.Product_Total_Warranty_Days__c==null){
                daysPercent = 100;
            }else{
                daysPercent = (noOfDays/(cs.Product_Total_Warranty_Days__c)*100).setscale(2);
            }
            cs.Warranty_Summary__c = 'Product purchased on '+cs.Product_Purchase_Date__c+' and case created on '
                                    +cs.CreatedDate+'.\n Warranty is for '+cs.Product_Total_Warranty_Days__c+' days and is '
                                    +daysPercent+' % through its warranty period.\n Extended warranty: '
                                    +cs.Product_Has_Extended_Warranty__c+ '\n Have a nice day!';
        }
    }
}