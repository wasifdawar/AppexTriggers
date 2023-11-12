// Whenever a Contact's description is updated then it's parent account's description should also get updated by it. 

trigger SFDC_Trigger4 on Contact (after update) 
{ 
    Set<Id> accIds = new Set<Id>();
    if(trigger.isAfter && trigger.isUpdate)
    {
        if(!trigger.new.isEmpty())
        {
            for(Contact con : trigger.new)
            {
                if(con.AccountId != null && trigger.oldMap.get(con.Id).Description != con.Description )
                {
                    accIds.add(con.AccountId);
                }
            }
        }
    }
    if(!accIds.isEmpty())
    {
    Map<Id, Account> accMap = new Map<Id,Account>([Select Id, Description from Account where Id IN: accIds]);
    List<Account> ListToBeUpadted = new List<Account>();
    if(!trigger.new.isEmpty())
    {
        for(Contact cont : trigger.new)
        {
          Account acc = accMap.get(cont.AccountId);
            acc.Description = cont.Description;
            ListToBeUpadted.add(acc);
        }
    }
    if(!ListToBeUpadted.isEmpty())
    {
        update ListToBeUpadted;
    }
}

}