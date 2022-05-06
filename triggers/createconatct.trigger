trigger createconatct on Account (before insert,after update){ 
 Set<Id> set_accountId = new Set<Id>();
      list<contact> conlist = new  list<contact>();
    for(account acc : trigger.new){
        contact con = [select id, Name, LeadSource from contact where AccountId IN :set_accountId];
        if(acc.Type=='Prospect'){
            con.AccountId = acc.Id;
            con.LeadSource = 'Web';
            
            conlist.add(con);
        }
        
        insert conlist;
    }
}