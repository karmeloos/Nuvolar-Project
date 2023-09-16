@isTest
public with sharing class FlightTriggerTest {
    @IsTest
    static void successTriggerTest(){
        Airport__c testAirport = new Airport__c(Name = 'Test Name', IATA_Code__c = 'TST', Localization__Longitude__s = 0, Localization__Latitude__s = 0);
        insert testAirport;
        Flight__c testFlight = new Flight__c(Name = 'Test Name', Arrival_Airport__c = testAirport.Id, Departure_Airport__c = testAirport.Id);
        Test.startTest();
        Database.SaveResult result = Database.insert(testFlight, false);
        Test.stopTest();
        System.assert(result.isSuccess(), 'Test should not generate errors.');
        System.assertEquals(result.getErrors().size(), 0, 'Test should not generate errors.');
    }
}