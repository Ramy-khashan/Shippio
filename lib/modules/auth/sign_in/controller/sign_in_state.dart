part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final RequestStatus setLoginRequest;

  final String? errorMessage;
  final bool isPasswordVisible;

  const SignInState({
    this.setLoginRequest = RequestStatus.init,
    this.errorMessage,
    this.isPasswordVisible = false,
  });

  SignInState copyWith({
    RequestStatus? setLoginRequest,
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
