trigger PreventDeletionOfCar on Car__c (before delete) {
    CarTriggerHandler.preventionDeletionOfSoldCar(trigger.old);
}