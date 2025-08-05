@EndUserText.label: 'Vehicle'
define root view entity ZI_Vehicle
  key vehicle_id   : abap.uuid,
      vehicle_no    : abap.char(10),
      description   : abap.char(80),
      to_FuelLogs   : composition [0..*] of ZI_VehicleFuelLog on to_FuelLogs.vehicle_id = $projection.vehicle_id;
