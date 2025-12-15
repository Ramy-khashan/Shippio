part of 'trip_process_bloc.dart';

sealed class TripProcessEvent extends Equatable {
  const TripProcessEvent();

  @override
  List<Object> get props => [];
}

class SetMarkerEvent extends TripProcessEvent {
  final PositionModel markerPlace;
  final TripProcessEnum markerType;

  const SetMarkerEvent({required this.markerPlace, required this.markerType});
}

class OnSubmitEvent extends TripProcessEvent {
  final BuildContext context;
  final TripProcessEnum tripProcess;
  const OnSubmitEvent({required this.tripProcess, required this.context});
}

class OnNavigationBackEvent extends TripProcessEvent {
  final BuildContext context;

  const OnNavigationBackEvent({required this.context});
}

class PrepareMarkersEven extends TripProcessEvent {}

class OnChangeMarkerPlace extends TripProcessEvent {
  final TripProcessEnum tripProcess;

  const OnChangeMarkerPlace({required this.tripProcess});
}

class AddressEvent extends TripProcessEvent {
  final BuildContext context;

  final PositionModel position;
  final TripProcessEnum markerType;

  const AddressEvent({
    required this.position,
    required this.markerType,
    required this.context,
  });
}

class OnSelectVehicleEvent extends TripProcessEvent {
  final int vehicleId;

  const OnSelectVehicleEvent({required this.vehicleId});
}

class OnSelectPaymentEvent extends TripProcessEvent {
  final PaymentTypeEnum paymentType;

  const OnSelectPaymentEvent({required this.paymentType});
}

class ShowSummaryEven extends TripProcessEvent {
  final BuildContext context;

  const ShowSummaryEven({required this.context});
}
