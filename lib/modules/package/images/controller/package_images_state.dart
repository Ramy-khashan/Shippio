part of 'package_images_bloc.dart';

class PackageImagesState extends Equatable {
  const PackageImagesState({
    this.imagesList = const [],
    this.getImages = RequestState.init,
  });
  final RequestState getImages;
  final List<FileProcessModel> imagesList;
  @override
  List<Object> get props => [imagesList,getImages
  ];
  PackageImagesState copyWith({
    RequestState? getImages,
    List<FileProcessModel>? imagesList,
  }) => PackageImagesState(
    imagesList: imagesList ?? this.imagesList,
    getImages: getImages ?? this.getImages,
  );
}
