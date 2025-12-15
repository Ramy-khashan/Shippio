part of 'trip_process_bloc.dart';

class TripProcessState extends Equatable {
  const TripProcessState({
    this.selectedVehicleId = 0,
    this.markerSet = const {},
    this.updateStatus = UpdateStatus.init,
    this.selectedPayment = PaymentTypeEnum.init,
    this.getAddressStatus = RequestStatus.init,
    this.tripProcess = TripProcessEnum.pickUpLocation,
  });
  final UpdateStatus updateStatus;
  final RequestStatus getAddressStatus;
  final Set<MarkerModel> markerSet;
  final TripProcessEnum tripProcess;
  final int selectedVehicleId;
  final PaymentTypeEnum selectedPayment;

  @override
  List<Object?> get props => [
    markerSet,
    tripProcess,
    updateStatus,
    getAddressStatus,
    selectedVehicleId,
    selectedPayment,
  ];
  TripProcessState copyWith({
    UpdateStatus? updateStatus,
    RequestStatus? getAddressStatus,
    TripProcessEnum? tripProcess,
    PaymentTypeEnum? selectedPayment,
    Set<MarkerModel>? markerSet,
    int? selectedVehicleId,
  }) => TripProcessState(
    updateStatus: updateStatus ?? this.updateStatus,
    getAddressStatus: getAddressStatus ?? this.getAddressStatus,
    markerSet: markerSet ?? this.markerSet,
    tripProcess: tripProcess ?? this.tripProcess,
    selectedVehicleId: selectedVehicleId ?? this.selectedVehicleId,
    selectedPayment: selectedPayment ?? this.selectedPayment,
  );
}
