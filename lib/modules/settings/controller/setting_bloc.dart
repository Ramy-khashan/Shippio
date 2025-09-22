import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/components/glassy_show_bottom_sheet.dart';
import '../../../core/constant/app_colors.dart';
import '../model/language_model.dart';
import '../model/setting_model.dart';
import '../view/widget/change_language_part.dart';
import '../view/widget/delete_account_part.dart';
import '../view/widget/techinical_support_part.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingState()) {
    on<ChangeLanguageEvent>((event, emit) {
      emit(state.copyWith(languageVal: event.languageVal));
    });
    on<SettingTabTapsEvent>(_navigationToggle);
    on<ShowBottomSheetEvent>(_openBottomSheet);
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
  _navigationToggle(SettingTabTapsEvent even, emit) {
    switch (settingTab[even.index].pagePath) {
      case "language":
        add(
          ShowBottomSheetEvent(
            child: BlocProvider.value(value: this, child: ChangeLanguagePart()),
            context: even.context,
          ),
        );
        break;
      case "delete":
        add(
          ShowBottomSheetEvent(
            child: DeleteAccountPart(),
            context: even.context,
          ),
        );

        break;
      case "technical":
        add(
          ShowBottomSheetEvent(
            child: TechinicalSupportPart(),
            context: even.context,
          ),
        );

        break;
      case "s":
      // context.pushNamed(AppRouterKeys.privacyCenterScreen);
      case "":
        // context.pushNamed(AppRouterKeys.yourBookingScreen);
        break;
      default:
      // context.pushNamed(settingTab[index].pagePath!);
    }
  }

  List<LanguageModel> languageList = [
    LanguageModel(language: "English", code: "en"),
    LanguageModel(language: "العربية", code: "ar"),
  ];
  _openBottomSheet(ShowBottomSheetEvent even, emit) {
    showModalBottomSheet(
      scrollControlDisabledMaxHeightRatio: 1,
      backgroundColor: AppColors.whiteColor.withValues(alpha: .05),
      enableDrag: true,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      context: even.context,
      builder: (BuildContext context) {
        return GlassyShowBottomSheet(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: 80,
                  height: 7,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,

                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                even.child,
              ],
            ),
          ),
        );
      },
    );
  }
}
