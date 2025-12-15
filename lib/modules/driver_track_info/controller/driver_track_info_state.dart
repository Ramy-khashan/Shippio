part of 'driver_track_info_bloc.dart';

class DriverTrackInfoState extends Equatable {
  const DriverTrackInfoState({
    this.markerSet = const {},
    this.polylines = const {},
    this.pickUpLocation,
    this.destinationLocation,
    this.driverLocation,
    this.distance = "",
    this.duration = "",
    this.getDriverStatus = RequestStatus.init,
  });
  final Set<MarkerModel> markerSet;
  final PositionModel? pickUpLocation;
  final PositionModel? destinationLocation;
  final PositionModel? driverLocation;
  final String distance;
  final String duration;
  final Set<PolylineModel> polylines;
  final RequestStatus getDriverStatus;

  @override
  List<Object?> get props => [
    markerSet,
    pickUpLocation,
    destinationLocation,
    driverLocation,
    polylines,
    distance,
    duration,
    getDriverStatus,
  ];
  DriverTrackInfoState copyWith({
    Set<MarkerModel>? markerSet,
    Set<PolylineModel>? polylines,
    PositionModel? pickUpLocation,
    PositionModel? destinationLocation,
    PositionModel? driverLocation,
    String? distance,
    String? duration,
    RequestStatus? getDriverStatus,
  }) => DriverTrackInfoState(
    markerSet: markerSet ?? this.markerSet,
    polylines: polylines ?? this.polylines,
    pickUpLocation: pickUpLocation ?? this.pickUpLocation,
    destinationLocation: destinationLocation ?? this.destinationLocation,
    driverLocation: driverLocation ?? this.driverLocation,
    distance: distance ?? this.distance,
    duration: duration ?? this.duration,
    getDriverStatus: getDriverStatus ?? this.getDriverStatus,
  );
}
