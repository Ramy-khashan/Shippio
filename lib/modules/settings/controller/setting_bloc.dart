import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../model/language_model.dart';
import '../model/setting_model.dart';
import '../view/widget/change_language_part.dart';
import '../view/widget/delete_account_part.dart';
import '../view/widget/techinical_support_part.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingState()) {
    on<SettingEvent>((event, emit) {
      if (event is ChangeLanguageEvent) {
        emit(state.copyWith(languageVal: event.languageVal));
      }
      if (event is SettingTabTapsEvent) {
        navigationToggle(index: event.index, context: event.context);
      }
    });
  }
  List<SettingModel> settingTab = [
    SettingModel(title: "Your Orders", icon: Icons.history_edu, pagePath: ""),
    SettingModel(
      title: "Technical Support",
      icon: Icons.help_outline,
      pagePath: "technical",
    ),
    SettingModel(
      title: "Privacy Center",
      icon: Icons.privacy_tip_outlined,
      pagePath: "",
    ),
    SettingModel(
      title: "Change Language",
      icon: Icons.language,
      pagePath: "language",
    ),
    SettingModel(
      title: "Delete Account",
      icon: CupertinoIcons.trash,
      pagePath: "delete",
    ),
    SettingModel(
      title: "Log Out",
      icon: Icons.logout_outlined,
      pagePath: "logout",
    ),
  ];
  navigationToggle({required int index, required BuildContext context}) {
    switch (settingTab[index].pagePath) {
      case "language":
        showChangeLanguageModel(context.read<SettingBloc>());
        break;
      case "delete":
        showDeleteAccountModel();
        break;
      case "technical":
        showTechnicalSupportModel();
        break;
      case "s":
      // context.pushNamed(AppRouterKeys.privacyCenterScreen);
      case "":
        // context.pushNamed(AppRouterKeys.yourBookingScreen);
        break;
      default:
        context.pushNamed(settingTab[index].pagePath!);
    }
  }

  List<LanguageModel> languageList = [
    LanguageModel(language: "English", code: "en"),
    LanguageModel(language: "العربية", code: "ar"),
  ];
}
