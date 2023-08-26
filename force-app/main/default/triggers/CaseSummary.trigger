trigger CaseSummary on Case (before insert, before update, after insert, after update) {
    if((Trigger.isUpdate && Trigger.isAfter)||(Trigger.isInsert && Trigger.isAfter)){
        for(Case cs: Trigger.New){
            Integer noOfDays = Date.today().daysBetween((Date)cs.CreatedDate);
            Decimal daysPercent = noOfDays/(cs.Product_Total_Warranty_Days__c)*100;
            cs.Warranty_Summary__c = 'Product purchased on '+cs.Product_Purchase_Date__c+' and case created on '
                                    +cs.CreatedDate+'. Warranty is for '+cs.Product_Total_Warranty_Days__c+' days and is '
                                    +daysPercent+' % through its warranty period. Extended warranty: '
                                    +cs.Product_Has_Extended_Warranty__c+ ' Have a nice day!';
        }
    }
}