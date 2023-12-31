public with sharing class FlightTriggerHandler implements ITriggerHandler {
  public void beforeInsert(List<SObject> newItems) {
    new DistanceService().handleDistanceService((List<Flight__c>) newItems);
  }
  public void beforeUpdate(
    Map<Id, SObject> newItems,
    Map<Id, SObject> oldItems
  ) {
  }
  public void beforeDelete(Map<Id, SObject> oldItems) {
  }
  public void afterInsert(Map<Id, SObject> newItems) {
  }
  public void afterUpdate(
    Map<Id, SObject> newItems,
    Map<Id, SObject> oldItems
  ) {
  }
  public void afterDelete(Map<Id, SObject> oldItems) {
  }
  public void afterUndelete(Map<Id, SObject> oldItems) {
  }
}
