 import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/controller/home_bloc.dart';
import '../../home/view/home_screen.dart';
import '../../package_history/view/package_history_screen.dart';
import '../../settings/controller/setting_bloc.dart';
import '../../settings/view/setting_screen.dart';
import '../model/navigation_bar_model.dart';

part 'navigation_bar_event.dart';
part 'navigation_bar_state.dart';

class NavigationBarBloc extends Bloc<NavigationBarEvent, NavigationBarState> {
  NavigationBarBloc() : super(NavigationBarState()) {
    on<NavigationBarEvent>((event, emit) {
      if (event is ChangePageEvent) {
        onChangePage(event, emit);
      }
    });
  }
  static NavigationBarBloc get(context) => BlocProvider.of(context);
  onChangePage(ChangePageEvent event, emit) {
    emit(state.copyWith(selectedPage: event.selectedPageIndex));
  }

  List<NavigationBarModel> pagesList = [
    NavigationBarModel(
      title: "Home",
      icon: CupertinoIcons.home,
      page: BlocProvider(
        create: (context) => HomeBloc(),
        child: const HomeScreen(),
      ),
    ),
    NavigationBarModel(
      title: "History",
      icon: Icons.history_edu,
      page: PackageHistoryScreen(),
    ),
    NavigationBarModel(
      title: "Settings",
      icon: CupertinoIcons.settings,
      page: BlocProvider(
        create: (context) => SettingBloc(),
        child: SettingScreen(),
      ),
    ),
  ];
}
