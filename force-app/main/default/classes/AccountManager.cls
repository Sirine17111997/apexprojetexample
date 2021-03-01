@RestResource(urlMapping='/Accounts/*/Contacts')
global  class AccountManager {
    public AccountManager() {

    }
    @HttpGet 
    global static Account getAccountById() {
        RestRequest request = RestContext.request;
        // grab the AccountId 
        String AccountId = request.requestURI.substringBetween('Accounts/','/Contacts');
         System.debug(AccountId);
        Account result =  [SELECT Id,Name,(SELECT Id,Name FROM Contacts)
                        FROM Account
                        WHERE Id = :AccountId LIMIT 1];
        return result;
    }
}
