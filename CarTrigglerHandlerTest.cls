@isTest
public class CarTrigglerHandlerTest {
	@isTest
    static void testPreventDeletionOfSoldCar() {
        Part__c testPart = new Part__c();
        testPart.Name = 'samplePart';
        insert testPart;
   		Car__c testCar = new Car__c();
        testCar.Name = 'testCar';
        testCar.Sold__c = true;
        testCar.Part__c = testPart.Id;
        testCar.Model__c = 'Tesla Model 3';
        insert testCar;
        try {
            delete testCar;
        }
        catch(Exception ex) {
            System.assert(ex.getMessage().contains('Sold cars cannot be deleted.'), 'Unexpected message.'); 
        }
    }
}