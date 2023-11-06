// When account's phone field is updated then all related contacts phone should also get updated with parent account's phone.

trigger SFDC_Trigger3 on Account (after update)
{ 
    Map<Id, Account> accMap = new Map<Id,Account>();
  if(trigger.isAfter && trigger.isUpdate)
  {
      if(!trigger.new.isEmpty())
      {
          for(Account acc : trigger.new)
          {
              if(trigger.oldMap.get(acc.Id).phone != acc.Phone)
              {
                  accMap.put(acc.Id,acc);
              }
          }
      }
  }
    List<Contact> conList = [select Id, AccountId, Phone from Contact where AccountId IN: accMap.keySet() ];
    List<Contact> listToUpdateContacts = new List<Contact>();
    if(!conList.isEmpty())
    {
      for(Contact con : conList )
      {
          con.Phone = accMap.get(con.AccountId).Phone;
          listToUpdateContacts.add(con);
      }      
    }
    if(!listToUpdateContacts.isEmpty())
    {
        update listToUpdateContacts;
    }
    
    
}