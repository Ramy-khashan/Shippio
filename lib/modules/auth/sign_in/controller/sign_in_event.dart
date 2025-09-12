part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}
final class SignInButtonPressed extends SignInEvent {
  final String email;
  final String password;

  const SignInButtonPressed({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
final class TogglePasswordVisibility extends SignInEvent {
  final bool isPasswordVisible;

  const TogglePasswordVisibility({required this.isPasswordVisible});

  @override
  List<Object> get props => [isPasswordVisible];
}
