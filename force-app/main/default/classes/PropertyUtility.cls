public inherited sharing class PropertyUtility {
    public PropertyUtility() {

    }
    public static void newListedProperties(){
        List<Property__c> newPropList = [Select Name,Broker__r.Email__c,Days_On_Market__c from Property__c where Days_On_Market__c < 31];
        for(Property__c pro:newPropList){
            String propEmail = '<' + pro.Name +'>'+ ':' + '<'+pro.Broker__r.Email__c+'>';
            System.debug(propEmail);
    }
}
}
