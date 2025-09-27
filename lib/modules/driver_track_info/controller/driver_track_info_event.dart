part of 'driver_track_info_bloc.dart';

sealed class DriverTrackInfoEvent extends Equatable {
  const DriverTrackInfoEvent();

  @override
  List<Object> get props => [];
}

class GetMarkerAndPosition extends DriverTrackInfoEvent {
  final Set<Marker> markers;

  const GetMarkerAndPosition({required this.markers});
}

class OnDrawPolylineEven extends DriverTrackInfoEvent {}

class OnShowMarkerPositioneEven extends DriverTrackInfoEvent {
  final Position position;
    final BuildContext context;

  const OnShowMarkerPositioneEven({required this.position,required this.context});
}

class ShowDriverEven extends DriverTrackInfoEvent {
    final BuildContext context;

  const ShowDriverEven({required this.context});
}class OnAssignDriverEven extends DriverTrackInfoEvent {
    final BuildContext context;

  const OnAssignDriverEven({required this.context});
}
