import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/setting_bloc.dart';
import 'widget/header_info.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),

          child: BlocBuilder<SettingBloc, SettingState>(
            builder: (context, state) {
              return Column(
                children: [
                  HeaderInfo(),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: context.read<SettingBloc>().settingTab.length,
                    itemBuilder: (context, index) => ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      onTap: () {
                        context.read<SettingBloc>().add(
                          SettingTabTapsEvent(index: index, context: context),
                        );
                      },
                      leading: Icon(
                        context.read<SettingBloc>().settingTab[index].icon,
                      ),
                      title: Text(
                        context.read<SettingBloc>().settingTab[index].title,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
