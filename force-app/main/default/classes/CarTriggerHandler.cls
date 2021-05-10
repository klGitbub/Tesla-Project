public class CarTriggerHandler {
    public static void preventionDeletionOfSoldCar(List<Car__c> deletedCars) {
        //If Sold is true on Car add error saying you cannnot delete.
       
    	for (Car__c car: deletedCars) {
            if (car.Sold__c == true) {
                car.addError('Sold cars cannot be deleted.');
            }
        }
    }
    		
}