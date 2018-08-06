@isTest
public class iTest_DataFactory
{
    //TODO-me do something exciting here
public static Map<String, Id> prodMap     = new Map<String, Id>();
public static Map<String, Id> pbeMap      = new Map<String, Id>();
public static Map<String, Id> accMap      = new Map<String, Id>();
public static Map<String, Id> conMap      = new Map<String, Id>();
public static Map<String, Id> conMapConId = new Map<String, Id>();
public static Map<String, Id> campMap     = new Map<String, Id>();
public static Map<String, Id> oppyMap     = new Map<String, Id>();
public static Id gatewayId;
public static List<User> userList = new List<User>();

public static void toggleTriggerControlsInstance(Boolean boo)
{
    TriggerControls__c tc = new TriggerControls__c();
    tc = TriggerControls__c.getInstance();
    if (boo)
    {
        tc.AccountMasterTrigger_Deactivated__c         = true;
        tc.CampaignMasterTrigger_Deactivated__c        = true;
        tc.ContactMasterTrigger_Deactivated__c         = true;
        tc.EVABatchMasterTrigger_Deactivated__c        = true;
        tc.OLIMasterTrigger_Deactivated__c             = true;
        tc.OpportunityMasterTrigger_Deactivated__c     = true;
        tc.PaymentMasterTrigger_Deactivated__c         = true;
        tc.PaymentMethodMasterTrigger_Deactivated__c   = true;
        tc.ProcessingBatchMasterTrigger_Deactivated__c = true;
        tc.RDLIMasterTrigger_Deactivated__c            = true;
        tc.RDMasterTrigger_Deactivated__c              = true;
        tc.TransactionMasterTrigger_Deactivated__c     = true;
        tc.SystemDeactivated__c                        = true;
        tc.QueueablesDeactivated__c                    = true;
    }
    else
    {
        tc.AccountMasterTrigger_Deactivated__c         = false;
        tc.CampaignMasterTrigger_Deactivated__c        = false;
        tc.ContactMasterTrigger_Deactivated__c         = false;
        tc.EVABatchMasterTrigger_Deactivated__c        = false;
        tc.OLIMasterTrigger_Deactivated__c             = false;
        tc.OpportunityMasterTrigger_Deactivated__c     = false;
        tc.PaymentMasterTrigger_Deactivated__c         = false;
        tc.PaymentMethodMasterTrigger_Deactivated__c   = false;
        tc.ProcessingBatchMasterTrigger_Deactivated__c = false;
        tc.RDLIMasterTrigger_Deactivated__c            = false;
        tc.RDMasterTrigger_Deactivated__c              = false;
        tc.TransactionMasterTrigger_Deactivated__c     = false;
        tc.SystemDeactivated__c                        = false;
        tc.QueueablesDeactivated__c                    = false;
    }

    tc.Oppys360ToNPSP_Trigger_Deactivated__c = true;
    upsert tc;
}
public static void toggleTriggerControlsOrg(Boolean boo)
{
    TriggerControls__c tc = new TriggerControls__c();
    tc = TriggerControls__c.getOrgDefaults();
    if (boo)
    {
        tc.AccountMasterTrigger_Deactivated__c         = true;
        tc.CampaignMasterTrigger_Deactivated__c        = true;
        tc.ContactMasterTrigger_Deactivated__c         = true;
        tc.EVABatchMasterTrigger_Deactivated__c        = true;
        tc.OLIMasterTrigger_Deactivated__c             = true;
        tc.OpportunityMasterTrigger_Deactivated__c     = true;
        tc.PaymentMasterTrigger_Deactivated__c         = true;
        tc.PaymentMethodMasterTrigger_Deactivated__c   = true;
        tc.ProcessingBatchMasterTrigger_Deactivated__c = true;
        tc.RDLIMasterTrigger_Deactivated__c            = true;
        tc.RDMasterTrigger_Deactivated__c              = true;
        tc.TransactionMasterTrigger_Deactivated__c     = true;
        tc.SystemDeactivated__c                        = true;
        tc.QueueablesDeactivated__c                    = true;
    }
    else
    {
        tc.AccountMasterTrigger_Deactivated__c         = false;
        tc.CampaignMasterTrigger_Deactivated__c        = false;
        tc.ContactMasterTrigger_Deactivated__c         = false;
        tc.EVABatchMasterTrigger_Deactivated__c        = false;
        tc.OLIMasterTrigger_Deactivated__c             = false;
        tc.OpportunityMasterTrigger_Deactivated__c     = false;
        tc.PaymentMasterTrigger_Deactivated__c         = false;
        tc.PaymentMethodMasterTrigger_Deactivated__c   = false;
        tc.ProcessingBatchMasterTrigger_Deactivated__c = false;
        tc.RDLIMasterTrigger_Deactivated__c            = false;
        tc.RDMasterTrigger_Deactivated__c              = false;
        tc.TransactionMasterTrigger_Deactivated__c     = false;
        tc.SystemDeactivated__c                        = false;
        tc.QueueablesDeactivated__c                    = false;
    }

    tc.Oppys360ToNPSP_Trigger_Deactivated__c = true;
    upsert                       tc;

    RecurringDonationControls__c rdc = new RecurringDonationControls__c();
    rdc                     = RecurringDonationControls__c.getOrgDefaults();
    rdc.DaysoftheWeek__c    = 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday';
    rdc.RetryDaysGap__c     = 1;
    rdc.RetryAttempts__c    = 10;
    rdc.HardDeclineCodes__c = '999';
    rdc.SoftDeclineCodes__c = '888';
    upsert rdc;
}

public static void holdTriggerControls()
{
    iControl.firstTriggerString         = 'HOLD';
    iControl.expectedFirstTriggerString = 'HOLD';
}
public static void init_NPSP()
{
    List<npsp__Trigger_Handler__c> handlers = npsp.TDTM_Config_API.getDefaultRecords();
    for (npsp__Trigger_Handler__c th :handlers)
    {
        if (th.npsp__Object__c == 'Opportunity' || th.npsp__Object__c == 'Campaign'
            || th.npsp__Object__c == 'npe03__Recurring_Donation__c'
            //|| th.npsp__Object__c == 'Contact'
            )
        {
            th.npsp__Active__c = false;
        }
    }
    upsert handlers;
}
public static void init_s360()
{
    TriggerControls__c tc = new TriggerControls__c();
    tc.SetupOwnerId                          = UserInfo.getOrganizationId();
    tc.Oppys360ToNPSP_Trigger_Deactivated__c = true;
    upsert                         tc;

    s360a__supporter360Settings__c settings = s360a__supporter360Settings__c.getOrgDefaults();
    settings.SetupOwnerId                      = UserInfo.getOrganizationId();
    settings.s360a__TriggerDisabledProfiles__c = 'Cosmos Administrator C2,TestyMcTest,CosmosAdmin';     //,Cosmos Standard User C2
    upsert settings;
}
public static void init_Chargent()
{
    Id                       payflowTypeId = Schema.SObjectType.ChargentBase__Gateway__c.getRecordTypeInfosByName().get('SecureCo').getRecordTypeId();

    ChargentBase__Gateway__c gateway = new ChargentBase__Gateway__c(
        RecordTypeId = payflowTypeId
        , Name = 'new gateway', ChargentBase__Merchant_Reference__c = 'VSA'
        , ChargentBase__Merchant_ID__c = 'appichar1113', ChargentBase__Username__c = 'appichar1113'
        , ChargentBase__Security_Key__c = 'Merchant001', ChargentBase__Available_Card_Types__c = 'Visa; Mastercard; American Express'
        , ChargentBase__Available_Currencies__c = 'Australian dollar', ChargentBase__Available_PR_Transaction_Types__c = 'Charge Full Amount'
        , ChargentBase__Active__c = true, ChargentBase__Test_Mode__c = true, ChargentBase__Credit_Card_Data_Handling__c = 'Clear After All Transactions'
        , ChargentBase__Available_Payment_Methods__c = 'Credit Card', ChargentBase__Charge_Amount_Behavior__c = 'Use Opportunity/Order/Case Charge Amount'
        );
    insert gateway;
    gatewayId = gateway.Id;
}
public static List<User> createUser(String profile)
{
    List<User> records = new List<User>();
    //Profile    p        = [SELECT Id FROM Profile WHERE Name = 'Cosmos Standard User C2'];
    // Profile    adminOLD = [SELECT Id FROM Profile WHERE Name = 'Cosmos Administrator C2 - Legacy'];
    Profile    adminp   = [SELECT Id FROM Profile WHERE Name = 'TestyMcTest'];
    if (profile == 'admin')
    {
        user r2 = new User(
            Alias = 'admin'
            , TimeZoneSidKey = 'Australia/Sydney'
            , Username = 'admin@asasds.com'
            , LocalesIdKey = 'en_US'
            , EmailEncodingKey = 'UTF-8'
            , ProfileId = adminp.Id
            , LanguageLocaleKey = 'en_US'
            , FirstName = 'admin'
            , LastName = 'admin'
            , email = 'admin@bar2.com'
            , Disable_Automation__c = true
            );
        records.add(r2);
    }
    // else if (profile == 'adminOLD')
    // {
    //     user r2 = new User(
    //         Alias = 'admin'
    //         , TimeZoneSidKey = 'Australia/Sydney'
    //         , Username = 'admin@asasds.com'
    //         , LocalesIdKey = 'en_US'
    //         , EmailEncodingKey = 'UTF-8'
    //         , ProfileId = adminOLD.Id
    //         , LanguageLocaleKey = 'en_US'
    //         , FirstName = 'admin'
    //         , LastName = 'admin'
    //         , email = 'admin@bar2.com'
    //         , Disable_Automation__c = true
    //         );
    //     records.add(r2);
    // }
    // else
    // {
    //     user r1 = new User(
    //         Alias = 'foo2'
    //         , TimeZoneSidKey = 'Australia/Sydney'
    //         , Username = '281rfeeww@asasds.com'
    //         , LocalesIdKey = 'en_US'
    //         , EmailEncodingKey = 'UTF-8'
    //         , ProfileId = p.Id
    //         , LanguageLocaleKey = 'en_US'
    //         , FirstName = 'Captaineos'
    //         , LastName = 'Uberiski'
    //         , email = 'foo2@bar2.com'
    //         , Disable_Automation__c = true
    //         );
    //     records.add(r1);
    // }

    insert records;
    //init_NPSP();
    init_s360();
    init_Chargent();
    toggleTriggerControlsOrg(false);
    iControl.reset();
    userList.addAll(records);

    // s360a__supporter360Settings__c settings = s360a__supporter360Settings__c.getOrgDefaults();
    // system.debug('s360a__supporter360Settings__c settings = '+string.valueof(settings));
    return records;
}
public static void createContacts(Integer num)
{
    List<Contact> records = new List<Contact>();
    Set<Id>       idSet   = new Set<Id>();
    for (Integer i = 0; i < num; i++)
    {
        Contact r = new Contact(FirstName = string.valueof(i), LastName = string.valueof(i)
                                , MailingStreet = 'Street ' + i, MailingCity = 'City ' + i, MailingPostalCode = '200' + i
                                , MailingCountry = 'Australia', StateContact2__c = null, Email = 'uber' + i + '@email.com', Phone = '100' + i);
        if (i == 0)
        {
            r.MailingState = 'NSW';r.Relationship_Manager_1__c = userList[0].Id;r.Relationship_Manager_2__c = userList[0].Id;r.Relationship_Manager_3__c = userList[0].Id;
        }
        else if (i == 1)
        {
            r.MailingState = 'VIC';
        }
        else if (i == 2)
        {
            r.MailingState = 'ACT';
        }
        else if (i == 3)
        {
            r.MailingState = 'WA';
        }
        else if (i == 4)
        {
            r.MailingState = 'SA';
        }
        else if (i == 5)
        {
            r.MailingState = 'NT';
        }
        else if (i == 6)
        {
            r.MailingState = 'TAS';
        }
        else if (i == 7)
        {
            r.MailingState = 'QLD';
        }
        else if (i == 8)
        {
            r.MailingState = '';
        }
        else if (i == 9)
        {
            r.StateContact2__c = 'NSW';
        }
        else if (i == 10)
        {
            r.StateContact2__c = 'VIC';
        }
        else if (i == 11)
        {
            r.StateContact2__c = 'ACT';
        }
        else if (i == 12)
        {
            r.StateContact2__c = 'WA';
        }
        else if (i == 13)
        {
            r.StateContact2__c = 'SA';
            r.RTS_Date__c      = date.today();
            r.OtherStreet      = null;
        }
        else if (i == 14)
        {
            r.StateContact2__c           = 'NT';
            r.Same_as_Mailing_Address__c = false;
            r.OtherStreet                = 'Other st';
            r.RTS__c                     = true;
        }
        else if (i == 15)
        {
            r.StateContact2__c = 'TAS';
            r.RTS__c           = true;
            r.OtherStreet      = 'Street ' + i;
            r.OtherCity        = 'City ' + i;
            r.OtherPostalCode  = '200' + i;
            r.OtherCountry     = 'Australia';
        }
        else if (i == 16)
        {
            r.StateContact2__c           = 'National';
            r.Same_as_Mailing_Address__c = false;
            r.OtherStreet                = 'Other st';
        }
        else
        {
            r.StateContact2__c   = 'QLD';
            r.C2GLMiddleValue__c = '350';
            r.C2GLSuffixValue__c = '4000';
        }
        records.add(r);
    }
    insert        records;

    List<Account> accList = [select Id, npe01__SYSTEMIsIndividual__c from Account where npe01__One2OneContact__c in:idSet and npe01__SYSTEMIsIndividual__c = false];
    for (Account r:accList)
    {
        r.npe01__SYSTEMIsIndividual__c = true;
    }
    update accList;

    for (Contact r: [select Id, LastName, AccountId from Contact])
    {
        conMap.put(r.LastName, r.AccountId);
        conMapConId.put(r.LastName, r.Id);
    }
    iControl.reset();
}
public static void createAccounts(Integer num)
{
    List<Account> records = new List<Account>();
    for (Integer i = 0; i < num; i++)
    {
        Account r = new Account(Name = string.valueof(i), BillingStreet = 'Street ' + i, BillingCity = 'City ' + i, BillingPostalCode = '200' + i
                                , BillingCountry = 'Australia');

        if (i == 0)
        {
            r.BillingState = 'NSW';
        }
        else if (i == 1)
        {
            r.BillingState = 'VIC';
        }
        else if (i == 2)
        {
            r.BillingState = 'ACT';
        }
        else if (i == 3)
        {
            r.BillingState = 'WA';
        }
        else if (i == 4)
        {
            r.BillingState = 'SA';
        }
        else if (i == 5)
        {
            r.BillingState = 'NT';
        }
        else if (i == 6)
        {
            r.BillingState = 'TAS';
        }
        else if (i == 7)
        {
            r.BillingState = 'QLD';
        }
        else if (i == 8)
        {
            r.BillingState = '';
        }
        else if (i == 9)
        {
            r.StateGLAccountOverride2__c = 'NSW';
        }
        else if (i == 10)
        {
            r.StateGLAccountOverride2__c = 'VIC';
        }
        else if (i == 11)
        {
            r.StateGLAccountOverride2__c = 'ACT';
        }
        else if (i == 12)
        {
            r.StateGLAccountOverride2__c = 'WA';
        }
        else if (i == 13)
        {
            r.StateGLAccountOverride2__c = 'SA';
            r.RTS_Date__c                = date.today();
            r.ShippingStreet             = null;
        }
        else if (i == 14)
        {
            r.StateGLAccountOverride2__c = 'NT';
            r.Same_as_Mailing_Address__c = false;
            r.ShippingStreet             = 'Shipping st';
            r.RTS__c                     = true;
        }
        else if (i == 15)
        {
            r.StateGLAccountOverride2__c = 'TAS';
            r.RTS__c                     = true;
            r.ShippingStreet             = 'Street ' + i;
            r.ShippingCity               = 'City ' + i;
            r.ShippingPostalCode         = '200' + i;
            r.ShippingCountry            = 'Australia';
        }
        else if (i == 16)
        {
            r.StateGLAccountOverride2__c = 'National';
            r.Same_as_Mailing_Address__c = false;
            r.ShippingStreet             = 'Shipping st';
        }
        else
        {
            r.StateGLAccountOverride2__c = 'QLD';
            r.C2GLMiddleValue__c         = '350';
            r.C2GLSuffixValue__c         = '4000';
        }
        records.add(r);
    }
    insert records;

    for (Account r: [select Id, Name from Account])
    {
        accMap.put(r.Name, r.Id);
    }

    iControl.reset();
}
public static void createCampaigns(Integer num)
{
    holdTriggerControls();
    List<Campaign> recordsLv1 = new List<Campaign>();
    for (Integer i = 0; i < num; i++)
    {
        Campaign r = new Campaign();

        if (i == 0)
        {
            r.Name                             = '0';
            r.StateCampaign2__c                = 'NSW';
            r.Fundraiser__c                    = accMap.get(string.valueof(i));
            r.Facilitator__c                   = accMap.get(string.valueof(i + 1));
            r.EnableFundraisingDistribution__c = true;
        }
        else if (i == 1)
        {
            r.Name                             = '1';
            r.C2GLMiddleValueOverride__c       = '999';
            r.Fundraiser__c                    = accMap.get(string.valueof(i));
            r.Facilitator__c                   = null;
            r.EnableFundraisingDistribution__c = false;
        }
        else if (i == 2)
        {
            r.Name                       = '2';
            r.C2GLSuffixValueOverride__c = '9999';
            r.Fundraiser__c              = null;
            r.Facilitator__c             = accMap.get(string.valueof(i));
        }
        else if (i == 3)
        {
            r.Name              = '3';
            r.StateCampaign2__c = 'ACT';
        }
        else if (i == 4)
        {
            r.Name              = '4';
            r.StateCampaign2__c = 'VIC';
        }
        else
        {
            r.Name = 'free 1';
        }

        recordsLv1.add(r);
    }
    insert         recordsLv1;

    List<Campaign> recordsLv2 = new List<Campaign>();
    for (Integer i = 0; i < num; i++)
    {
        Campaign r = new Campaign();
        if (i == 0)
        {
            r.Name     = '00';
            r.ParentId = recordsLv1[i].Id;
        }
        else if (i == 1)
        {
            r.Name              = '11';
            r.ParentId          = recordsLv1[i].Id;
            r.StateCampaign2__c = 'National';
        }
        else if (i == 2)
        {
            r.Name     = '22';
            r.ParentId = recordsLv1[i].Id;
        }
        else if (i == 3)
        {
            r.Name              = '33';
            r.ParentId          = recordsLv1[i].Id;
            r.StateCampaign2__c = 'NT';
        }
        else if (i == 4)
        {
            r.Name     = '44';
            r.ParentId = recordsLv1[i].Id;
        }
        else
        {
            r.Name = 'free 2';
        }
        recordsLv2.add(r);
    }
    insert         recordsLv2;

    List<Campaign> recordsLv3 = new List<Campaign>();
    for (Integer i = 0; i < num; i++)
    {
        Campaign r = new Campaign();
        if (i == 0)
        {
            r.Name     = '000';
            r.ParentId = recordsLv2[i].Id;
        }
        else if (i == 1)
        {
            r.Name     = '111';
            r.ParentId = recordsLv2[i].Id;
        }
        else if (i == 2)
        {
            r.Name              = '222';
            r.ParentId          = recordsLv2[i].Id;
            r.StateCampaign2__c = 'TAS';
        }
        else if (i == 3)
        {
            r.Name     = '333';
            r.ParentId = recordsLv2[i].Id;
        }
        else if (i == 4)
        {
            r.Name     = '444';
            r.ParentId = recordsLv2[i].Id;
        }
        else
        {
            r.Name = 'free 3';
        }
        recordsLv3.add(r);
    }
    insert         recordsLv3;

    List<Campaign> recordsLv4 = new List<Campaign>();
    for (Integer i = 0; i < num; i++)
    {
        Campaign r = new Campaign();
        if (i == 0)
        {
            r.Name     = '0000';
            r.ParentId = recordsLv3[i].Id;
        }
        else if (i == 1)
        {
            r.Name              = '1111';
            r.ParentId          = recordsLv3[i].Id;
            r.StateCampaign2__c = 'WA';
        }
        else if (i == 2)
        {
            r.Name     = '2222';
            r.ParentId = recordsLv3[i].Id;
        }
        else if (i == 3)
        {
            r.Name     = '3333';
            r.ParentId = recordsLv3[i].Id;
        }
        else if (i == 4)
        {
            r.Name              = '4444';
            r.ParentId          = recordsLv3[i].Id;
            r.StateCampaign2__c = 'QLD';
        }
        else
        {
            r.Name = 'free 4';
        }
        recordsLv4.add(r);
    }
    insert recordsLv4;

    iControl.reset();

    List<Campaign> recordsLv5 = new List<Campaign>();
    for (Integer i = 0; i < num; i++)
    {
        Campaign r = new Campaign();
        if (i == 0)
        {
            r.Name              = '00000';
            r.ParentId          = recordsLv4[i].Id;
            r.StateCampaign2__c = 'SA';
        }
        else if (i == 1)
        {
            r.Name     = '11111';
            r.ParentId = recordsLv4[i].Id;
        }
        else if (i == 2)
        {
            r.Name     = '22222';
            r.ParentId = recordsLv4[i].Id;
        }
        else if (i == 3)
        {
            r.Name     = '33333';
            r.ParentId = recordsLv4[i].Id;
        }
        else if (i == 4)
        {
            r.Name     = '44444';
            r.ParentId = recordsLv4[i].Id;
        }
        else
        {
            r.Name = 'free 5';
        }
        recordsLv5.add(r);
    }
    insert recordsLv5;

    for (Campaign r: [select Id, Name from Campaign])
    {
        campMap.put(r.Name, r.Id);
    }
    iControl.reset();
}
public static void createProducts(Integer num)
{
    Pricebook2     pb2     = new Pricebook2();
    List<Product2> records = new List<Product2>();
    for (Integer i = 0; i < num; i++)
    {
        Product2 r = new Product2(IsActive = true);

        if (i == 0)
        {
            r.Name = 'null'; r.C2GLPrefixValue__c = null; r.C2GLMiddleValue__c = null; r.C2GLSuffixValue__c = null; r.C2TaxRate__c = 0;
        }
        else if (i == 1)
        {
            r.Name = 'Prefix'; r.C2GLPrefixValue__c = '11'; r.C2GLMiddleValue__c = null; r.C2GLSuffixValue__c = null; r.C2TaxRate__c = 10;
        }
        else if (i == 2)
        {
            r.Name = 'Middle'; r.C2GLPrefixValue__c = null; r.C2GLMiddleValue__c = '222'; r.C2GLSuffixValue__c = null;
        }
        else if (i == 3)
        {
            r.Name = 'Suffix'; r.C2GLPrefixValue__c = null; r.C2GLMiddleValue__c = null; r.C2GLSuffixValue__c = '3333';
        }
        else if (i == 4)
        {
            r.Name = 'Donations'; r.C2GLPrefixValue__c = null; r.C2GLMiddleValue__c = null; r.C2GLSuffixValue__c = '4009'; r.C2IncludeInIncomeStatistics__c = true;
        }
        else if (i == 5)
        {
            r.Name = 'Donated Goods & Services'; r.C2GLPrefixValue__c = null; r.C2GLMiddleValue__c = null; r.C2GLSuffixValue__c = '9999'; r.C2IncludeInDGSStatistics__c = true; r.C2IncludeInIncomeStatistics__c = true;
        }
        else if (i == 6)
        {
            r.Name = 'Shining Stars'; r.C2GLPrefixValue__c = null; r.C2GLMiddleValue__c = null; r.C2GLSuffixValue__c = '8000'; r.C2IncludeInShiningStarsStatistics__c = true; r.C2IncludeInIncomeStatistics__c = true;
        }
        else
        {
            r.Name = 'ALL OVERRIDE'; r.C2GLPrefixValue__c = '00'; r.C2GLMiddleValue__c = '000'; r.C2GLSuffixValue__c = '0000';
        }

        records.add(r);
    }
    insert records;

    pb2 = new Pricebook2(Name = 'Standard Price Book', Description = 'Standard Price Book', IsActive = true);
    insert               pb2;
    Id                   StandardPB = Test.getStandardPricebookId();

    List<PricebookEntry> recordsPBE = new List<PricebookEntry>();
    for (Integer i = 0; i < num; i++)
    {
        PricebookEntry r = new PricebookEntry(Pricebook2Id = StandardPB, Product2Id = records[i].Id, UnitPrice = 0, IsActive = true);
        recordsPBE.add(r);
    }
    for (Integer i = 0; i < num; i++)
    {
        PricebookEntry r = new PricebookEntry(Pricebook2Id = pb2.Id, Product2Id = records[i].Id, UnitPrice = 0, IsActive = true);
        recordsPBE.add(r);
    }

    insert recordsPBE;

    for (Product2 r: [select Id, Name from Product2 where IsActive = true])
    {
        prodMap.put(r.Name, r.Id);
    }
    for (PricebookEntry r: [select Id, Name from PricebookEntry where IsActive = true and Pricebook2Id =: pb2.Id])
    {
        pbeMap.put(r.Name, r.Id);
    }
}
public static void createOpportunities(Integer num)
{
    List<Opportunity> records = new List<Opportunity>();

    for (Integer i = 0; i < num; i++)
    {
        Opportunity r      = new Opportunity(StageName = 'Outstanding', CloseDate = date.today(), SystemRequireTransactionHandling__c = 'Yes');
        Id          accId  = iTest_DataFactory.accMap.get(string.valueof(i));
        Id          campId = iTest_DataFactory.campMap.get(string.valueof(i));
        Integer     amt    = i + 1;

        if (i == 0)
        {
            r.Name             = 'null'; r.AccountId = accId; r.CampaignId = campId; r.Amount = amt;
            r.ProductSingle__c = iTest_DataFactory.prodMap.get('null');
        }
        else if (i == 1)
        {
            r.Name             = 'null'; r.AccountId = accId; r.CampaignId = campId; r.Amount = amt;
            r.ProductSingle__c = iTest_DataFactory.prodMap.get('Prefix');
        }
        else if (i == 2)
        {
            r.Name             = 'null'; r.AccountId = accId; r.CampaignId = campId; r.Amount = amt;
            r.ProductSingle__c = iTest_DataFactory.prodMap.get('Middle');
        }
        else if (i == 3)
        {
            r.Name             = 'null'; r.AccountId = accId; r.CampaignId = campId; r.Amount = amt;
            r.ProductSingle__c = iTest_DataFactory.prodMap.get('Suffix');
        }
        else if (i == 4)
        {
            r.Name             = 'null'; r.AccountId = accId; r.CampaignId = campId; r.Amount = amt;
            r.ProductSingle__c = iTest_DataFactory.prodMap.get('Donations');
        }
        else
        {
            r.Name             = 'null'; r.AccountId = accId; r.CampaignId = campId; r.Amount = amt;
            r.ProductSingle__c = iTest_DataFactory.prodMap.get('All Override');
        }

        records.add(r);
    }
    insert records;

    for (Opportunity r: [select Id, Amount from Opportunity])
    {
        oppyMap.put(string.valueof(r.Amount), r.Id);
    }
    iControl.reset();
}
public static void createPaidOpportunities(Integer num)
{
    List<Opportunity> records = new List<Opportunity>();

    for (Integer i = 0; i < num; i++)
    {
        Opportunity r      = new Opportunity(StageName = 'Outstanding', CloseDate = date.today(), SystemRequireTransactionHandling__c = 'Yes', PaymentMethod__c = 'Cash');
        Id          accId  = iTest_DataFactory.accMap.get(string.valueof(i));
        Id          campId = iTest_DataFactory.campMap.get(string.valueof(i));
        Integer     amt    = i + 1;

        if (i == 0)
        {
            r.Name             = 'null'; r.AccountId = accId; r.CampaignId = campId; r.Amount = amt;
            r.ProductSingle__c = iTest_DataFactory.prodMap.get('null');
        }
        else if (i == 1)
        {
            r.Name             = 'null'; r.AccountId = accId; r.CampaignId = campId; r.Amount = amt;
            r.ProductSingle__c = iTest_DataFactory.prodMap.get('Prefix');
        }
        else if (i == 2)
        {
            r.Name             = 'null'; r.AccountId = accId; r.CampaignId = campId; r.Amount = amt;
            r.ProductSingle__c = iTest_DataFactory.prodMap.get('Middle');
        }
        else if (i == 3)
        {
            r.Name             = 'null'; r.AccountId = accId; r.CampaignId = campId; r.Amount = amt;
            r.ProductSingle__c = iTest_DataFactory.prodMap.get('Suffix');
        }
        else if (i == 4)
        {
            r.Name             = 'null'; r.AccountId = accId; r.CampaignId = campId; r.Amount = amt;
            r.ProductSingle__c = iTest_DataFactory.prodMap.get('Donations');
        }
        else
        {
            r.Name             = 'null'; r.AccountId = accId; r.CampaignId = campId; r.Amount = amt;
            r.ProductSingle__c = iTest_DataFactory.prodMap.get('All Override');
        }

        records.add(r);
    }
    insert records;

    for (Opportunity r: [select Id, Amount from Opportunity])
    {
        oppyMap.put(string.valueof(r.Amount), r.Id);
    }
    iControl.reset();
}
}