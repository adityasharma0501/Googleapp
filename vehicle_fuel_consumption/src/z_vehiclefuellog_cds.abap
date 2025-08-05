@EndUserText.label: 'Vehicle Fuel Log'
define view entity ZI_VehicleFuelLog
  key fuel_log_id        : abap.uuid,
      vehicle_id         : abap.uuid,
      fuel_type          : abap.char(10),
      quantity_ltr       : abap.dec(13,3),
      odometer_km        : abap.dec(13,2),
      fill_datetime      : abap.utclong,
      mileage_since_last : abap.dec(13,2);
