import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/app_colors.dart';
import '../../controller/setting_bloc.dart';

class ChangeLanguagePart extends StatelessWidget {
  const ChangeLanguagePart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        return SizedBox(
          height: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Text(
                  "Change Language",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              RadioGroup(
                groupValue: state.languageVal,
                onChanged: (lang) {
                  context.read<SettingBloc>().add(
                    ChangeLanguageEvent(languageVal: lang.toString()),
                  );
                },
                child: Column(
                  children: [
                    ...context.read<SettingBloc>().languageList.map(
                      (lang) => RadioListTile(
                        activeColor: AppColors.opacityPrimaryColor,
                        value: lang.code,

                        title: Text(lang.language),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
