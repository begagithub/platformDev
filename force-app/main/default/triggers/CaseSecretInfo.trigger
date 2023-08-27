trigger CaseSecretInfo on Case (before insert, before update, after insert, after update) {
    if((Trigger.isInsert && Trigger.isAfter)||(Trigger.isUpdate && Trigger.isBefore)){
        System.debug('Trigger starts here');
        String childCaseSubject = 'Warning: Parent case may contain secret info';
        List<Case> casesWithSecretInfo = new List<Case>();
        List<Case> childCases = new List<Case>();
        List<String> secretWords = new List<String>{'Credit Card', 'Social Security', 'SSN', 'Passport', 'Bodyweight'};    
        System.debug('The key secret words are '+secretWords);

        for(Case myTriggerCase: Trigger.new){
            System.debug('The subject of this case is: '+myTriggerCase.Subject);
            if(myTriggerCase.Subject!=childCaseSubject){
                String caseDescription = myTriggerCase.Description;
                System.debug('The description of my trigger case is: '+caseDescription);
                List<String> existingSecretWords = new List<String>();
                
                for(String secretWord: secretWords){
                    if(caseDescription!=null && caseDescription.containsIgnoreCase(secretWord)){
                        System.debug('Case '+myTriggerCase.Id+' includes secret information '+secretWord);
                        existingSecretWords.add(secretWord);
                        System.debug('Existing secret words in this case are: '+existingSecretWords);
                    }
                }
                if(existingSecretWords!=null){
                    Case childCase = new Case();
                    childCase.ParentId      = myTriggerCase.Id;
                    childCase.Description   = 'The parent Case has the following secret information: '
                                              +existingSecretWords;
                    childCase.ContactId     = myTriggerCase.ContactId;
                    childCase.AccountId     = myTriggerCase.AccountId;
                    childCase.Status        = 'Escalated';
                    childCase.Origin        = myTriggerCase.Origin;
                    childCase.Priority      = 'High';
                    childCase.Subject       = 'Warning: Parent case may contain secret info';
                    childCase.IsEscalated   = true;
                    
                    System.debug('New child case is '+childCase);
                    childCases.add(childCase);
                }
            }
        }
        System.debug('All new child cases are '+childCases);
        if(childCases!=null){
            insert childCases;
        }
    }
}
            
            /*
            if(caseDescription!=null){
                System.debug('Testing if the process comes here???');
                if(caseDescription.containsIgnoreCase('Credit Card')|| 
                   caseDescription.containsIgnoreCase('Social Security')||
                   caseDescription.containsIgnoreCase('SSN')||
                   caseDescription.containsIgnoreCase('Passport')) {
                    System.debug('Case '+myTriggerCase.Id+' includes secret information');
                    
                    Case childCase = new Case();
                    childCase.ParentId      = myTriggerCase.Id;
                    childCase.Description   = 'The parent Case has secret information';
                    childCase.ContactId     = myTriggerCase.ContactId;
                    childCase.AccountId     = myTriggerCase.AccountId;
                    childCase.Status        = 'Escalated';
                    childCase.Origin        = myTriggerCase.Origin;
                    childCase.Priority      = 'High';
                    childCase.Subject       = 'Warning: Parent case may contain secret info';
                    childCase.IsEscalated   = true;
                    
                    System.debug('New child case is '+childCase);
                    childCases.add(childCase);
                }
            }
            */