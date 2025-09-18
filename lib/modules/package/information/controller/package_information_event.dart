part of 'package_information_bloc.dart';

sealed class PackageInformationEvent extends Equatable {
  const PackageInformationEvent();

  @override
  List<Object> get props => [];
}

class OnSubmitInfoEvent extends PackageInformationEvent {
  final BuildContext context;

  const OnSubmitInfoEvent({required this.context});
}
