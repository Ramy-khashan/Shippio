import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'on_boarding_event.dart';
part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  OnBoardingBloc() : super(OnBoardingState()) {
    on<HandleAnimationEvent>((event, emit) => _onHandleAnimation(event, emit));
  }

  Future<void> _onHandleAnimation(
    HandleAnimationEvent event,
    Emitter<OnBoardingState> emit,
  ) async {
    await Future.delayed(const Duration(milliseconds: 300));
    emit(state.copyWith(containerExpanded: true, buttonVisible: false));

    await Future.delayed(const Duration(milliseconds: 1500));
    emit(state.copyWith(containerExpanded: true, buttonVisible: true));
  }
}
