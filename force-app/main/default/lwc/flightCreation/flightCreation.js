import { LightningElement } from "lwc";
import Arrival_Airport__c from "@salesforce/schema/Flight__c.Arrival_Airport__c";
import Departure_Airport__c from "@salesforce/schema/Flight__c.Departure_Airport__c";
import Distance__c from "@salesforce/schema/Flight__c.Distance__c";

export default class FlightCreation extends LightningElement {
  objectApiName = "Flight__c";
  arrival = Arrival_Airport__c;
  depature = Departure_Airport__c;
  distance = Distance__c;
  flightId;

  handleSuccess(event) {
    this.flightId = event.detail.id;
  }

  handleNew() {
    this.flightId = null;
  }
}