@isTest
public with sharing class DistanceServiceTest {

    @IsTest
    static void nullTest(){
        Boolean isError = false;
        Test.startTest();
        try {
            new DistanceService().handleDistanceService(null);
        } catch (NullPointerException ex) {
            isError = true;
        }
        Test.stopTest();
        System.assert(isError, 'Method should throw exception');
    }

    @IsTest
    static void successHandleDistanceServiceTest(){
        Airport__c testAirport = new Airport__c(Name = 'Test Airport', IATA_Code__c = 'TST' , Localization__Longitude__s = 0, Localization__Latitude__s = 0);
        insert testAirport;
        Flight__c testFlight = new Flight__c(Name = 'testName', Departure_Airport__c = testAirport.Id, Arrival_Airport__c = testAirport.Id);
        Boolean noError = true;
        Test.startTest();
        try {
           new DistanceService().handleDistanceService(new List<Flight__c>{testFlight});
        } catch (Exception e) {
            noError = false;
        }
        Test.stopTest();
        System.assert(noError, 'Error should not be thrown.');
        System.assertNotEquals(null, testFlight.Distance__c, 'Distance should be diffrent than null');
    }

    @IsTest
    static void sameLocalizationTest(){
        Airport__c testAirport1 = new Airport__c(Localization__Latitude__s = 90, Localization__Longitude__s = 90);
        Airport__c testAirport2 = new Airport__c(Localization__Latitude__s = 90, Localization__Longitude__s = 90);
        Test.startTest();
        Decimal result = DistanceService.calculateDistance(testAirport1, testAirport2);
        Test.stopTest();
        System.assertEquals(0, result, 'Distance should be equal 0.');
    }
}