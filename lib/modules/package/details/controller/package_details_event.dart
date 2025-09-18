part of 'package_details_bloc.dart';

sealed class PackageDetailsEvent extends Equatable {
  const PackageDetailsEvent();

  @override
  List<Object> get props => [];
}

class ChangeHeightMeasureEvent extends PackageDetailsEvent {
  final String heightMeasureType;

  const ChangeHeightMeasureEvent({required this.heightMeasureType});
}

class ChangeWidthMeasureEvent extends PackageDetailsEvent {
  final String widthtMeasureType;

  const ChangeWidthMeasureEvent({required this.widthtMeasureType});
}

class ChangeWeightMeasureEvent extends PackageDetailsEvent {
  final String weightMeasureType;

  const ChangeWeightMeasureEvent({required this.weightMeasureType});
}
class OnSubmitEvent extends PackageDetailsEvent {
  final BuildContext context;

  const OnSubmitEvent({required this.context});
}
