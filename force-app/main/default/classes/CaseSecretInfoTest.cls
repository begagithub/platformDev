@isTest
public with sharing class CaseSecretInfoTest {

    @TestSetup
    static void makeData(){
        Case myTestCase = new Case(Status='New', Origin='Phone', 
                                   Description='My secret words are SSN, Credit Card, and Passport');
        insert myTestCase;
    }

    @isTest
    static void updateCaseSecretInforTest(){
        List<Case> casesToUpdate = [SELECT Id, Status, Origin, Description From Case Limit 1];
        casesToUpdate[0].Description = 'The updated secret words are Bodyweight and Social Security';
        update casesToUpdate[0];
    }
}