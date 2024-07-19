part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

/////////////// Loading ////////////////////////

final class AuthSignUpLoading extends AuthState {
  const AuthSignUpLoading();
}

final class AuthSignInLoading extends AuthState {
  const AuthSignInLoading();
}

final class AuthforgetPassLoading extends AuthState {
  const AuthforgetPassLoading();
}

final class AuthRestPassLoading extends AuthState {
  const AuthRestPassLoading();
}

final class AuthVerifyCodeLoading extends AuthState {
  const AuthVerifyCodeLoading();
}

/////////////// Auth Success ////////////////////////

final class AuthSignInSuccess extends AuthState {
  final User user;
  const AuthSignInSuccess(this.user);
  @override
  List<Object> get props => [user];
}

final class AuthSignUpSuccess extends AuthState {
  const AuthSignUpSuccess();
}

final class AuthForgetPassSuccess extends AuthState {
  const AuthForgetPassSuccess();
}

final class AuthResetPassSuccess extends AuthState {
  const AuthResetPassSuccess();
}

final class AuthVerifyCodeSuccess extends AuthState {
  const AuthVerifyCodeSuccess();
}

final class AuthResendCodeSuccess extends AuthState {
  const AuthResendCodeSuccess();
}

/////////////// Auth Failure ////////////////////////

final class AuthSignUpFailure extends AuthState {
  final String message;
  const AuthSignUpFailure(this.message);
  @override
  List<Object> get props => [message];
}

final class AuthSignInFailure extends AuthState {
  final String message;
  const AuthSignInFailure(this.message);
  @override
  List<Object> get props => [message];
}

final class AuthForgetPassFailure extends AuthState {
  final String message;
  const AuthForgetPassFailure(this.message);
  @override
  List<Object> get props => [message];
}

final class AuthResetPassFailure extends AuthState {
  final String message;
  const AuthResetPassFailure(this.message);
  @override
  List<Object> get props => [message];
}

final class AuthVerifyCodeFailure extends AuthState {
  final String message;
  const AuthVerifyCodeFailure(this.message);
  @override
  List<Object> get props => [message];
}

final class AuthResendCodeFailure extends AuthState {
  final String message;
  const AuthResendCodeFailure(this.message);
  @override
  List<Object> get props => [message];
}
