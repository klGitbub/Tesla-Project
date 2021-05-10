public class CarContractTriggerHandler {
	
    public static void preventContractingSoldCars(List<Car_Contract__c> updatedContracts) {
        //For each Car Contract, see it related Car has other Car Contracts.
		//If so, add error to Car Contract saying that car cannot be contracted.
		Set<Id> contractCars = new Set<Id>();
        for (Car_Contract__c contract: updatedContracts) {
            if (contract.Car__c != null) {
                contractCars.add(contract.Car__c);
            }
        }
        Map<Id, Car__c> carMap = new Map<Id, Car__c>([SELECT Id, (SELECT Id FROM Car_Contracts__r WHERE Id NOT in: updatedContracts) FROM Car__c WHERE Id in: contractCars]);
        for (Car_Contract__c contract: updatedContracts) {
            if (carMap.containsKey(contract.Car__c) && carMap.get(contract.Car__c).Car_Contracts__r?.size() > 0) {
                contract.addError('Cannot contract a sold car.');
            }
        }
    }
}