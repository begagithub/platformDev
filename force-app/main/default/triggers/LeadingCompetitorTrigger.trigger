trigger LeadingCompetitorTrigger on Opportunity (before insert, after insert, before update, after update) {
    if((Trigger.isInsert && Trigger.isBefore) || (Trigger.isUpdate && Trigger.isBefore)){

        for(Opportunity myTriggerOpp: Trigger.New){
            //Add all competitor prices in a List in the order of competitors**
            List<Decimal> compPrices = new List<Decimal>();
            compPrices.add(myTriggerOpp.Competitor_1_Price__c);
            compPrices.add(myTriggerOpp.Competitor_2_Price__c);
            compPrices.add(myTriggerOpp.Competitor_3_Price__c);
            
            //Add all competitors in a List in the order of competitor prices**
            List<String> competitors = new List<String>();
            competitors.add(myTriggerOpp.Competitor_1__c);
            competitors.add(myTriggerOpp.Competitor_2__c);
            competitors.add(myTriggerOpp.Competitor_3__c);

            //Loop through all competitor prices and find the position of the lowest competitor price**
            Decimal lowestCompPrice;
            Integer lowestPricePosition;
            for(Integer i=0; i<compPrices.size(); i++){
                if(lowestCompPrice==null || compPrices[i]<lowestCompPrice){
                    lowestCompPrice = compPrices[i];
                    lowestPricePosition=i;
                    //myTriggerOpp.Leading_Competitor__c = competitors[i]; ==> Can we do this instead of other logic?
                }
            }

            //Populate the leading competitor field with the competitor matching the lowest price position
            myTriggerOpp.Leading_Competitor__c = competitors[lowestPricePosition];

            /*
            Decimal compPriceOne        = myTriggerOpp.Competitor_1_Price__c;
            Decimal compPriceTwo        = myTriggerOpp.Competitor_2_Price__c;
            Decimal compPriceThree      = myTriggerOpp.Competitor_3_Price__c;

            compPrices.add(compPriceOne);
            compPrices.add(compPriceTwo);
            compPrices.add(compPriceThree);

            compPrices.sort();
            Decimal leastCompPrice = compPrices[0];

            for(Decimal reorderedCompPrice: compPrices){
                if(myTriggerOpp.Competitor_1_Price__c == leastCompPrice){
                    myTriggerOpp.Leading_Competitor__c = myTriggerOpp.Competitor_1__c;
                } else if(myTriggerOpp.Competitor_2_Price__c == leastCompPrice){
                    myTriggerOpp.Leading_Competitor__c = myTriggerOpp.Competitor_2__c;
                } else {
                    myTriggerOpp.Leading_Competitor__c = myTriggerOpp.Competitor_3__c;
                }
            }
            */
        }
    }
}