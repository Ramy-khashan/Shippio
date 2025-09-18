import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/router/router_keys.dart';
import '../model/package_details_model.dart';

part 'package_details_event.dart';
part 'package_details_state.dart';

class PackageDetailsBloc
    extends Bloc<PackageDetailsEvent, PackageDetailsState> {
  PackageDetailsBloc() : super(PackageDetailsState()) {
    on<PackageDetailsEvent>((event, emit) {
      if (event is ChangeHeightMeasureEvent) {
        emit(state.copyWith(heightMeasureType: event.heightMeasureType));
      } else if (event is ChangeWidthMeasureEvent) {
        emit(state.copyWith(widthtMeasureType: event.widthtMeasureType));
      } else if (event is ChangeWeightMeasureEvent) {
        emit(state.copyWith(weightMeasureType: event.weightMeasureType));
      } else if (event is OnSubmitEvent) {
        onSubmit(event.context);
      }
    });
  }
  static PackageDetailsBloc get(context) => BlocProvider.of(context);
  List<String> measurement = ["Inches", "Cm", "Foot"];
  PackageDetailsModel packageDetails = PackageDetailsModel(
    packageHeight: TextEditingController(),
    packageWeight: TextEditingController(),
    packageWidth: TextEditingController(),
    quantity: TextEditingController(),
  );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  onSubmit(BuildContext context) {
    // if (formKey.currentState!.validate()) {
      packageDetails.heightMeasuerment = state.heightMeasureType;
      packageDetails.weightMeasuerment = state.weightMeasureType;
      packageDetails.widhtMeasuerment = state.widthtMeasureType;
    //  debugPrint (packageDetails.toJson().toString());
      context.pushNamed(RouterKeys.packageInformationScreen);
    // }
  }
}
