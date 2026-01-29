import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constant/app_images.dart';

import '../model/package_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
  }
  static HomeBloc get(BuildContext context) => BlocProvider.of(context);
  List<PackageModel> packagesTypeList = [
    PackageModel(
      id: 1,
      name: "Food Delivery ",
      image: AppImages.food,
      hint: "less than 5 kg",
    ),
    PackageModel(
      id: 2,
      name: "Parcel",
      image: AppImages.parcel,
      hint: "less than 10 kg",
    ),
    PackageModel(
      id: 3,
      name: "Groceries",
      image: AppImages.groceries,
      hint: "less than 20 kg",
    ),
  ];
}
