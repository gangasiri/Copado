public class customerclass {
    @AuraEnabled
    public static string customerdata(string name3,string password3,integer cusid1){
        
        system.debug('name3---->'+name3);
        system.debug('password3---->'+password3);
        system.debug('cusid1---->'+cusid1);
      
        	Customer__c cos = [select id,Name,UserName__c,password__c,CustomerId__c from Customer__c where UserName__c =:name3 AND password__c=:password3 ];
        string output;
        if(cos.Name==name3 && cos.password__c==password3){
            
             system.debug('sucess');
            output='success';
        }else{
          system.debug('Failed');   
            output='Failed';
        }
        return output;
           
    }

}