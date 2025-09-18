part of 'setting_bloc.dart';

class SettingState extends Equatable {
  const SettingState({this.languageVal = "en"});
  final String languageVal;
  @override
  List<Object> get props => [languageVal];
  SettingState copyWith({String? languageVal}) =>
      SettingState(languageVal: languageVal ?? this.languageVal);
}
