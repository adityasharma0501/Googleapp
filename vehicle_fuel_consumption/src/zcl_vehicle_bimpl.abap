CLASS zcl_vehicle_bimpl DEFINITION
  PUBLIC
  FINAL
  FOR BEHAVIOR OF zi_vehicle.

  PRIVATE SECTION.
    METHODS calc_mileage FOR DETERMINE ON SAVE
      IMPORTING keys FOR FuelLog.
ENDCLASS.

CLASS zcl_vehicle_bimpl IMPLEMENTATION.
  METHOD calc_mileage.
    READ ENTITIES OF zi_vehicle IN LOCAL MODE
      ENTITY FuelLog
        FIELDS ( vehicle_id fuel_log_id odometer_km )
        WITH CORRESPONDING #( keys )
        RESULT DATA(fuellogs).

    LOOP AT fuellogs ASSIGNING FIELD-SYMBOL(<log>).
      SELECT MAX( odometer_km ) FROM zvehfuellog
        WHERE vehicle_id = @<log>-vehicle_id
          AND fuel_log_id <> @<log>-fuel_log_id
        INTO @DATA(prev_odo).

      IF sy-subrc = 0 AND prev_odo IS NOT INITIAL.
        <log>-mileage_since_last = <log>-odometer_km - prev_odo.
      ELSE.
        <log>-mileage_since_last = 0.
      ENDIF.
    ENDLOOP.

    MODIFY ENTITIES OF zi_vehicle IN LOCAL MODE
      ENTITY FuelLog
        UPDATE FIELDS ( mileage_since_last )
        WITH VALUE #( FOR log IN fuellogs ( fuel_log_id = log-fuel_log_id mileage_since_last = log-mileage_since_last ) ).
  ENDMETHOD.
ENDCLASS.
