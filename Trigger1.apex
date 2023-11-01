//Trigger On Account When Phone Field is Empty

trigger SFDC_Trigger1 on Account (before insert) {
    if(trigger.isBefore && trigger.isInsert)
    {
        if(!trigger.new.isEmpty())
        {
            for(Account acc : trigger.new)
            {
                if(acc.Phone == null)
                {
                    acc.Phone.addError('You can not insert account with empty Phone Filed' );               }
            }
        }
    }

}