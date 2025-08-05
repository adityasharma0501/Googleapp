const { executeHttpRequest, wrapJwtInHeader } = require('@sap-cloud-sdk/http-client');
const { retrieveJwt, getDestination } = require('@sap-cloud-sdk/connectivity');

async function pushFuelLog(log) {
  const dest = await getDestination({ destinationName: 'S4H_VEHICLE_FUEL' });
  const requestConfig = {
    method: 'POST',
    url: '/sap/opu/odata4/sap/zui_vehicle_fuel_srv/0001/VehicleFuelLogs',
    data: log,
    headers: { 'Content-Type': 'application/json' }
  };
  const jwt = await retrieveJwt();
  const response = await executeHttpRequest(dest, requestConfig, {csrf: true, headers: wrapJwtInHeader(jwt)});
  console.log('Fuel log created', response.data);
}

module.exports = { pushFuelLog };
