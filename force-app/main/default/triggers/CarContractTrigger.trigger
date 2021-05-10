trigger CarContractTrigger on Car_Contract__c (before insert, before update) {
    if (trigger.isInsert) {
        CarContractTriggerHandler.preventContractingSoldCars(trigger.new);
    }
    else {
        CarContractTriggerHandler.preventContractingSoldCars(trigger.old);
    }
	
}