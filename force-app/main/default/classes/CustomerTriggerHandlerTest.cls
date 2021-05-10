@isTest
public class CustomerTriggerHandlerTest {
	@isTest
    static void testPreventDuplicateCustomers() {
        Store__c sampleStore = new Store__c();
        sampleStore.Name = 'Sample Store';
        insert sampleStore;
        Customer__c customer1 = new Customer__c();
        customer1.name = 'Test Customer';
        customer1.Store__c = sampleStore.Id;
        insert customer1;
        Customer__c customer2 = new Customer__c();
        customer2.Name = 'Test Customer';
        customer2.Store__c = sampleStore.id;
        try {
            insert customer2;
        }
        catch (Exception ex) {
            System.assert(ex.GetMessage().contains('Duplicate customers are not allowed.'), 'Unexpected message');
        }
    }
    
}