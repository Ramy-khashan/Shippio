import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../config/router/router_keys.dart';
import '../../../../../core/constant/app_enums.dart';
import '../../../../../core/models/file_process_model.dart';
import '../../../../../core/repository/file_process/file_process.dart';
import '../../../../../core/utils/functions/service_locator.dart';
part 'package_images_event.dart';
part 'package_images_state.dart';

class PackageImagesBloc extends Bloc<PackageImagesEvent, PackageImagesState> {
  PackageImagesBloc() : super(PackageImagesState()) {
    on<PackageImagesEvent>((event, emit) async {
      if (event is PickImageEvent) {
        await pickMultiImages(event, emit);
      }
      if (event is DeleteImageEvent) {
          deleteSelectedImage(event, emit);
      }
      if (event is OnSubmitEvent) {
          onSubmit(event, emit);
      }
    });
  }
  static PackageImagesBloc get(BuildContext context) => BlocProvider.of(context);
   Future<void> pickMultiImages(PickImageEvent event, emit) async {
    if (isClosed) return;
    emit(state.copyWith(getImages: RequestStatus.loading));
    await sl.get<FileProcess>()
        .allDocumentProcess()
        .then((image) {
          if (image != null) {
            List<FileProcessModel> images = [...state.imagesList];
            images.add(image);
            if (!isClosed) {
              emit(
                state.copyWith(
                  imagesList: images,
                  getImages: RequestStatus.success,
                ),
              );
            }
          } else {
            emit(state.copyWith(getImages: RequestStatus.failed));
          }
        })
        .onError((e, _) {
          if (!isClosed) {
            emit(state.copyWith(getImages: RequestStatus.failed));
          }
        });
  }

  void deleteSelectedImage(DeleteImageEvent event, emit) {
    List<FileProcessModel> images = [...state.imagesList];
    images.removeAt(event.selectedImageIndex);
    emit(state.copyWith(imagesList: images));
  }

  void onSubmit(OnSubmitEvent event, emit) {
     event.context.pushNamed(RouterKeys.tripProcessScreen);
  }
}
