part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final RequestState setLoginRequest;

  final String? errorMessage;
  final bool isPasswordVisible;

  const SignInState({
    this.setLoginRequest = RequestState.init,
    this.errorMessage,
    this.isPasswordVisible = false,
  });

  SignInState copyWith({
    RequestState? setLoginRequest,
    String? errorMessage,
    bool? isPasswordVisible,
  }) {
    return SignInState(
      setLoginRequest: setLoginRequest ?? this.setLoginRequest,
      errorMessage: errorMessage,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }

  @override
  List<Object?> get props => [setLoginRequest, errorMessage, isPasswordVisible];
}
