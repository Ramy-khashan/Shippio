part of 'on_boarding_bloc.dart';

@immutable
sealed class OnBoardingEvent {}

final class HandleAnimationEvent extends OnBoardingEvent {
  final bool buttonVisible;
  final bool containerExpanded;
  HandleAnimationEvent({  this.buttonVisible=false,   this.containerExpanded=false});
 }
 