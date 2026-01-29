part of 'on_boarding_bloc.dart';

@immutable
class OnBoardingState extends Equatable {
  final bool buttonVisible;
  final bool containerExpanded;

  const OnBoardingState({
    this.buttonVisible = false,
    this.containerExpanded = false,
  });
  @override
  List<Object> get props => [buttonVisible, containerExpanded];
  OnBoardingState copyWith({bool? buttonVisible, bool? containerExpanded}) {
    return OnBoardingState(
      buttonVisible: buttonVisible ?? this.buttonVisible,
      containerExpanded: containerExpanded ?? this.containerExpanded,
    );
  }
}
