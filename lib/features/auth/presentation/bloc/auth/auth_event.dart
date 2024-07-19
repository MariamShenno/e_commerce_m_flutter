// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthSignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String phone;
  const AuthSignUpEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  @override
  List<Object> get props => [name, email, password, phone];
}

class AuthSignInEvent extends AuthEvent {
  final String email;
  final String password;

  const AuthSignInEvent({
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [email, password];
}

class AuthForgetPassEvent extends AuthEvent {
  final String email;

  const AuthForgetPassEvent({
    required this.email,
  });

  @override
  List<Object> get props => [email];
}

class AuthResetPassEvent extends AuthEvent {
  final String email;

  final String newPassword;
  final String confirmPassword;

  const AuthResetPassEvent({
    required this.email,
    required this.newPassword,
    required this.confirmPassword,
  });

  @override
  List<Object> get props => [email, newPassword, confirmPassword];
}

class AuthVerifyCodeEvent extends AuthEvent {
  final String email;
  final String code;

  const AuthVerifyCodeEvent({
    required this.email,
    required this.code,
  });

  @override
  List<Object> get props => [email, code];
}

class AuthResendCodeEvent extends AuthEvent {
  final String email;

  const AuthResendCodeEvent({
    required this.email,
  });

  @override
  List<Object> get props => [email];
}
