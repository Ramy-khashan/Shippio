part of 'package_images_bloc.dart';

sealed class PackageImagesEvent extends Equatable {
  const PackageImagesEvent();

  @override
  List<Object> get props => [];
}

class PickImageEvent extends PackageImagesEvent {}

class OnSubmitEvent extends PackageImagesEvent {
  final BuildContext context;

  const OnSubmitEvent({required this.context});
}

class DeleteImageEvent extends PackageImagesEvent {
  final int selectedImageIndex;

  const DeleteImageEvent({required this.selectedImageIndex});
}
