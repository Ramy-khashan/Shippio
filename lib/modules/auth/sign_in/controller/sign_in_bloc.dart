import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/constant/app_enums.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<SignInEvent>((event, emit) {
      if (event is SignInButtonPressed) {
        handleSignIn(event, emit);
      } else if (event is TogglePasswordVisibility) {
        togglePasswordVisibility(event, emit);
      }
    });
  }
  handleSignIn(SignInButtonPressed event, emit) {}
  togglePasswordVisibility(TogglePasswordVisibility event, emit) {
    emit(state.copyWith(isPasswordVisible: event.isPasswordVisible));
  }
}
