@isTest
public class CarContractTriggerHandlerTest {
    @isTest
    static void testPreventContractingSoldCars() {
        //Create a sold test car
        //Create a car contract
        //Try to create another contract and validate that error message
        Part__c testPart = new Part__c();
        testPart.Name = 'samplePart';
        insert testPart;
   		Car__c testCar = new Car__c();
        testCar.Name = 'testCar';
        testCar.Sold__c = true;
        testCar.Part__c = testPart.Id;
        testCar.Model__c = 'Tesla Model 3';
        insert testCar;
        Car_Contract__c testContract = new Car_Contract__c();
        testContract.Car__c = testCar.Id;
        insert testContract;
        Car_Contract__c testContract2 = new Car_Contract__c();
        testContract2.Car__c = testCar.Id;
        try {
            insert testContract2;
        }
        catch (Exception ex) {
            System.assert(ex.GetMessage().contains('Cannot contract a sold car.'), 'Unexpected message.');
        }
        Car_Contract__c testContract3 = new Car_Contract__c();
        insert testContract3;
        testContract3.Car__c = testCar.Id;
        update testContract3;
    }
}