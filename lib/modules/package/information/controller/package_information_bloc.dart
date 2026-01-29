import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/router/router_keys.dart';

import '../model/package_info_model.dart';

part 'package_information_event.dart';
part 'package_information_state.dart';

class PackageInformationBloc
    extends Bloc<PackageInformationEvent, PackageInformationState> {
  PackageInformationBloc() : super(PackageInformationState()) {
    on<PackageInformationEvent>((event, emit) {
      if (event is OnSubmitInfoEvent) {
        onSubmitInfo(event.context);
      }
    });
  }
  static PackageInformationBloc get(BuildContext context) => BlocProvider.of(context);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  PackageInfoModel packageInfoModel = PackageInfoModel(
    packageInfo: TextEditingController(),
    additionalNotes: TextEditingController(),
  );
  void onSubmitInfo(BuildContext context) {
    // if (formKey.currentState!.validate()) {
    // debugPrint(packageInfoModel.toJson().toString());
    context.pushNamed(RouterKeys.packageImagesScreen);
    // }
  }
}
