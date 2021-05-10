public class CustomerTriggerHandler {
    public static void preventDuplicateCustomers(List<Customer__c> customers) {
        //For each customer check if the customer with the same name already exists.
        //If so, add an error saying that a duplicate customer is not allowed.
        Set<String> customerNames = new Set<String>();
        for (Customer__c customer: customers) {
            customerNames.add(customer.Name);
        }
        Set<String> existingNames = new Set<String>();
        for (Customer__c existingCustomer: [SELECT Id, Name FROM Customer__c where Name in: customerNames]) {
            existingNames.add(existingCustomer.Name);
        }
        for (Customer__c customer: customers) {
            if (existingNames.contains(customer.Name)) {
                customer.addError('Duplicate customers are not allowed.');
            }
        }
    }
}