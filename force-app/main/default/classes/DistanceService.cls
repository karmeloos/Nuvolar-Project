public with sharing class DistanceService {
  public void handleDistanceService(List<Flight__c> flightList) {
    if(flightList == null || flightList.isEmpty()) {
      throw new NullPointerException();
    }
    Map<Id,Airport__c> airportWithLocalization = getAirpotLocalization(flightList);
    for (Flight__c loopFlight : flightList) {
      Airport__c arrival = airportWithLocalization.get(loopFlight.Arrival_Airport__c);
      Airport__c depature = airportWithLocalization.get(loopFlight.Departure_Airport__c);
      loopFlight.Distance__c = calculateDistance(
        arrival, depature
      );
    }
  }

  private Map<Id,Airport__c> getAirpotLocalization(List<Flight__c> flightList) {
    Set<Id> airportIds = new Set<Id>();
    for (Flight__c loopFlight : flightList) {
        airportIds.add(loopFlight.Arrival_Airport__c);
        airportIds.add(loopFlight.Departure_Airport__c);
    }
    return new Map<Id,Airport__c>([SELECT Id, Localization__Latitude__s, Localization__Longitude__s FROM Airport__c WHERE Id IN :airportIds]);
  }
  
@testVisible
  private static Decimal calculateDistance(
   Airport__c arrival, Airport__c depature
  ) {
    Integer earthRadius = 6371;
    Decimal latitude1 = arrival.Localization__Latitude__s;
    Decimal longitude1 = arrival.Localization__Longitude__s;
    Decimal latitude2 = depature.Localization__Latitude__s;
    Decimal longitude2 = depature.Localization__Longitude__s;

    Decimal latitudeRadians1 = latitude1 * Math.PI / 180;
    Decimal latitudeRadians2 = latitude2 * Math.PI / 180;
    Decimal latitudeDelta = (latitude2 - latitude1) * Math.PI / 180;
    Decimal longitudeDelta = (longitude2 - longitude1) * Math.PI / 180;
    Decimal a =
      Math.sin(latitudeDelta / 2) * Math.sin(latitudeDelta / 2) +
      Math.cos(latitudeRadians1) *
      Math.cos(latitudeRadians2) *
      Math.sin(longitudeDelta / 2) * Math.sin(longitudeDelta / 2);
    Decimal arc = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    Decimal distance = earthRadius * arc;
    return distance;
  }
}
