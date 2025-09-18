import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/router/router_keys.dart';

import '../../../../core/constant/app_enums.dart';
import '../../../../core/models/file_process_model.dart';
import '../../../../core/repository/file_process/file_process.dart';

part 'package_images_event.dart';
part 'package_images_state.dart';

class PackageImagesBloc extends Bloc<PackageImagesEvent, PackageImagesState> {
  PackageImagesBloc() : super(PackageImagesState()) {
    on<PackageImagesEvent>((event, emit) async {
      if (event is PickImageEvent) {
        await pickMultiImages(event, emit);
      }
      if (event is DeleteImageEvent) {
        await deleteSelectedImage(event, emit);
      }
    });
  }
  static PackageImagesBloc get(context) => BlocProvider.of(context);
  FileProcess fileProcess = FileProcessImpl();
  pickMultiImages(event, emit) async {
    if (isClosed) return;
    emit(state.copyWith(getImages: RequestState.loading));

    await fileProcess
        .allDocumentProcess()
        .then((image) {
          if (image != null) {
            List<FileProcessModel> images = [...state.imagesList];
            images.add(image);
            if (!isClosed) {
              emit(
                state.copyWith(
                  imagesList: images,
                  getImages: RequestState.success,
                ),
              );
            }
          } else {
            emit(state.copyWith(getImages: RequestState.failed));
          }
        })
        .onError((e, _) {
          if (!isClosed) {
            emit(state.copyWith(getImages: RequestState.failed));
          }
        });
  }

  deleteSelectedImage(DeleteImageEvent event, emit) {
    List<FileProcessModel> images = [...state.imagesList];
    images.removeAt(event.selectedImageIndex);
    emit(state.copyWith(imagesList: images));
  }

  onSubmit(OnSubmitEvent event, emit) {
    event.context.pushNamed(RouterKeys.homeScreen);
  }
}
