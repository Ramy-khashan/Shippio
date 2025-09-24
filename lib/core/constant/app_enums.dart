enum RequestStatus { init, loading, success, failed }

enum UpdateStatus { init, start, end }

// enum MarkerEnum { pickUp, deliverTo }

enum TripProcessEnum {
  pickUpLocation,
  pickUpDetails,
  distnationLocation,
  distnationDetails,
  schedulePickupTime,
  tripVehicleType,
  confirmationTrip,
  selectPayment,
}

enum PaymentTypeEnum { init, stripe, fawry, paymob }

enum Position { pickUp, destination, driver }
