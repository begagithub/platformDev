List<Decimal> oppAmnts = new List<Decimal>();
for(Opportunity myopp: [SELECT Id, Amount From Opportunity]){
    oppAmnts.add(myopp.Amount);
}
System.debug(oppAmnts);
oppAmnts.sort();
System.debug(oppAmnts);
oppAmnts.get(0);
System.debug('The smallest opportunity amount is '+oppAmnts.get(0));