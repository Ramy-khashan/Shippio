part of 'setting_bloc.dart';

sealed class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

class ChangeLanguageEvent extends SettingEvent {
  final String languageVal;

  const ChangeLanguageEvent({required this.languageVal});
}

class SettingTabTapsEvent extends SettingEvent {
  final int index;
  final BuildContext context;

  const SettingTabTapsEvent({required this.index, required this.context});
}
