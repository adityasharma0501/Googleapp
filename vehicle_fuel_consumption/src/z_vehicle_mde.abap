@Metadata.layer: #CORE
extend view ZI_Vehicle with {
  @UI.lineItem: [{ position: 10 }]
  @UI.identification: [{ position: 10 }]
  vehicle_no;

  @UI.lineItem: [{ position: 20 }]
  @UI.identification: [{ position: 20 }]
  description;
}

extend view ZI_VehicleFuelLog with {
  @UI.lineItem: [{ position: 10 }]
  fuel_type;
  @UI.lineItem: [{ position: 20 }]
  quantity_ltr;
  @UI.lineItem: [{ position: 30 }]
  odometer_km;
  @UI.lineItem: [{ position: 40 }]
  fill_datetime;
  @UI.lineItem: [{ position: 50 }]
  mileage_since_last;
}
