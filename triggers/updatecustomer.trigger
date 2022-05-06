trigger updatecustomer on Opportunity (before insert,after update) {
    
list<Id> accIds = new list<Id>();
   list< Customer__c> customer = new list< Customer__c>();
    
    for(opportunity opp:trigger.new){
        accIds.add(opp.accountId);
        
    }
    for(Customer__c cus:[select Id, Email__c from Customer__c where Id IN :accIds]){
		for(opportunity opp:trigger.new){
			if(opp.StageName=='closed won'){
				cus.Email__c= 'Ganga@gmail.com';
				customer.add(cus);
			}
		}
	}
    update customer;
}