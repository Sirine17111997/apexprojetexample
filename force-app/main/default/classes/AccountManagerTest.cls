@IsTest
private  class AccountManagerTest {
    public AccountManagerTest() {

    }
    @isTest static void testGetAccountById() {
        Account objectAccount = new Account(Name='Test Account');
        insert(objectAccount);
        Contact Objecontact = new Contact( LastName='Test Contact' , AccountId=objectAccount.Id );
                // Set up a test request
        insert (Objecontact);
        RestRequest request = new RestRequest();
        Id recordId = objectAccount.Id;
        request.requestUri = 'https://yourInstance.salesforce.com/services/apexrest/Accounts/'+ recordId +'/Contacts';
    
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccountById();
        // Verify results
        System.assert( thisAccount!= null);
        System.assertEquals('Test record', thisAccount.Name);
    }
}

    