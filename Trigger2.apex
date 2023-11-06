//Trigger on account, When Billing address is insert , its autofill the shipping address same as billing address

trigger SFDC_Trigger2 on Account (before insert, before update) {
    if(trigger.isBefore && (trigger.isInsert || trigger.isUpdate))
    {
        if(!trigger.new.isEmpty())
        {
            for(Account acc : trigger.new)
            {
                if(acc.BillingCity != null)
                {
                    acc.ShippingCity = acc.BillingCity;
                }
                if(acc.BillingStreet != null)
                {
                    acc.ShippingStreet = acc.BillingStreet;
                }
                if(acc.BillingCountry != null)
                {
                    acc.ShippingCountry = acc.BillingCountry;
                }
                if(acc.BillingState != null)
                {
                    acc.ShippingState = acc.BillingState;
                }
                if(acc.BillingPostalCode != null)
                {
                    acc.ShippingPostalCode = acc.BillingPostalCode;
                }
            }
        }
    }

}