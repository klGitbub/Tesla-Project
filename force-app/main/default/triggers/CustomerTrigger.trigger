trigger CustomerTrigger on Customer__c (before insert) {
	CustomerTriggerHandler.preventDuplicateCustomers(trigger.new);
}