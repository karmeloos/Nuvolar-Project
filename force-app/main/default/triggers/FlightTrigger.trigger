trigger FlightTrigger on Flight__c(
  before insert,
  before update,
  before delete,
  after insert,
  after update,
  after delete,
  after undelete
) {
  TriggerDispacher.run(new FlightTriggerHandler());
}
