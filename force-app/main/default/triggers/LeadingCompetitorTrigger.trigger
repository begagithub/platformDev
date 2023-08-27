trigger LeadingCompetitorTrigger on Opportunity (before insert, after insert, before update, after update) {
    if((Trigger.isInsert && Trigger.isBefore) || (Trigger.isUpdate && Trigger.isBefore)){

        for(Opportunity myTriggerOpp: Trigger.New){
            
            List<Decimal> compPrices = new List<Decimal>();
            Decimal compPriceOne        = myTriggerOpp.Competitor_1_Price__c;
            Decimal compPriceTwo        = myTriggerOpp.Competitor_2_Price__c;
            Decimal compPriceThree      = myTriggerOpp.Competitor_3_Price__c;
            
            compPrices.add(compPriceOne);
            compPrices.add(compPriceTwo);
            compPrices.add(compPriceThree);

            compPrices.sort();
            Decimal leastCompPrice = compPrices[0];

            for(Decimal reorderedCompPrice: compPrices){
                if(myTriggerOpp.Competitor_1_Price__c.intValue() == leastCompPrice){
                    myTriggerOpp.Leading_Competitor__c = myTriggerOpp.Competitor_1__c;
                } else if(myTriggerOpp.Competitor_2_Price__c.intValue() == leastCompPrice){
                    myTriggerOpp.Leading_Competitor__c = myTriggerOpp.Competitor_2__c;
                } else {
                    myTriggerOpp.Leading_Competitor__c = myTriggerOpp.Competitor_3__c;
                }
            }
        }
    }
}