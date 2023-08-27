@isTest
private with sharing class LeadingCompetitor_Test {

    @TestSetup
    static void makeData(){
        Opportunity myInsertOpp = new Opportunity(Name                    = 'My Test Opprtuniry One',
                                                  CloseDate               = Date.today().addDays(20),
                                                  StageName               = 'Qualification',
                                                  Competitor_1__c         = 'Google',
                                                  Competitor_2__c         = 'Amazon',
                                                  Competitor_3__c         = 'Microsoft',
                                                  Competitor_1_Price__c   = 500.50,
                                                  Competitor_2_Price__c   = 550.50,
                                                  Competitor_3_Price__c   = 600.50);
        insert myInsertOpp;
    }

    @isTest
    static void leadingCompetitorTrigger_Test(){
        List<Opportunity> myUpdateOpps = [Select Id, Name, CloseDate, StageName,
                                          Competitor_1__c, Competitor_2__c, Competitor_3__c,
                                          Competitor_1_Price__c, Competitor_2_Price__c, Competitor_3_Price__c
                                          FROM Opportunity LIMIT 1];
        myUpdateOpps[0].Competitor_1_Price__c = 700;
        myUpdateOpps[0].Competitor_1_Price__c = 600;
        myUpdateOpps[0].Competitor_1_Price__c = 500;

        update myUpdateOpps[0];
    }
}