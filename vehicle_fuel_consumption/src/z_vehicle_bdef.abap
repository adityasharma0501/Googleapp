managed implementation in class ZCL_VEHICLE_BIMPL unique;

define behavior for ZI_Vehicle alias Vehicle
  persistent table zvehicle
  lock master
{
  create;
  update;
  delete;

  field (mandatory) vehicle_no;
  association to_FuelLogs { create; }
}

define behavior for ZI_VehicleFuelLog alias FuelLog
  persistent table zvehfuellog
  lock dependent by parent Vehicle
{
  create;
  update;
  delete;

  field (readonly) mileage_since_last;

  determination calc_mileage on save { create; }
}
