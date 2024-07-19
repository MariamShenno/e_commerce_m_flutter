import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../domain/entities/user.dart';
import '../../../domain/usecase/forget_password_use_case.dart';
import '../../../domain/usecase/resend_code_use_case.dart';
import '../../../domain/usecase/reset_password_use_case.dart';
import '../../../domain/usecase/user_login_use_case.dart';
import '../../../domain/usecase/user_sign_up_use_case.dart';
import '../../../domain/usecase/verify_code_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUpUseCase _userSignUpUseCase;
  final UserLoginUseCase _userSinginUseCase;
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final VerifyCodeUseCase _verifyCodeUseCase;
 final ResendCodeUseCase _resendCodeUseCase;

  AuthBloc({
    required UserSignUpUseCase userSignUpUseCase,
    required UserLoginUseCase userLoginUseCase,
    required ForgetPasswordUseCase forgetPasswordUseCase,
    required ResetPasswordUseCase resetPasswordUseCase,
    required VerifyCodeUseCase verifyCodeUseCase,
    required ResendCodeUseCase resendCodeUseCase,
  })  : _userSignUpUseCase = userSignUpUseCase,
        _userSinginUseCase = userLoginUseCase,
        _forgetPasswordUseCase = forgetPasswordUseCase,
        _resetPasswordUseCase = resetPasswordUseCase,
        _verifyCodeUseCase = verifyCodeUseCase,
        _resendCodeUseCase = resendCodeUseCase,
        super(AuthInitial()) {
    on<AuthSignUpEvent>(_onAuthSignUp);
    on<AuthSignInEvent>(_onAuthSignIn);
    on<AuthForgetPassEvent>(_onAuthForgetPass);
    on<AuthResetPassEvent>(_onAuthResetPass);
    on<AuthVerifyCodeEvent>(_onAuthVerifyCode);
    on<AuthResendCodeEvent>(_onAuthResendCode);
  }

  void _onAuthSignUp(AuthSignUpEvent event, Emitter<AuthState> emit) async {
    emit(const AuthSignUpLoading());
    final response = await _userSignUpUseCase(
      UserSignUpUseCaseParams(
        name: event.name,
        email: event.email,
        password: event.password,
        phone: event.phone,
      ),
    );
    response.fold(
      (failure) => emit(AuthSignUpFailure(failure.message!)),
      (_) => emit(const AuthSignUpSuccess()),
    );
  }

  void _onAuthSignIn(AuthSignInEvent event, Emitter<AuthState> emit) async {
    emit(const AuthSignInLoading());
    final response = await _userSinginUseCase(
      UserLoginUsecaseParams(
        email: event.email,
        password: event.password,
      ),
    );
    response.fold(
      (failure) => emit(AuthSignInFailure(failure.message!)),
      (user) => emit(AuthSignInSuccess(user)),
    );
  }

 void _onAuthForgetPass(
      AuthForgetPassEvent event, Emitter<AuthState> emit) async {
    emit(const AuthforgetPassLoading());
    final response = await _forgetPasswordUseCase(
      event.email,
    );
    response.fold(
      (failure) => emit(AuthForgetPassFailure(failure.message!)),
      (_) => emit(const AuthForgetPassSuccess()),
    );
  }

  void _onAuthResetPass(
      AuthResetPassEvent event, Emitter<AuthState> emit) async {
    emit(const AuthRestPassLoading());
    final response = await _resetPasswordUseCase(
      ResetPasswordUseCaseParams(
        email: event.email,
        newPassword: event.newPassword,
        confirmPassword: event.confirmPassword,
      ),
    );
    response.fold(
      (failure) => emit(AuthResetPassFailure(failure.message!)),
      (_) => emit(const AuthResetPassSuccess()),
    );
  }

  void _onAuthVerifyCode(
      AuthVerifyCodeEvent event, Emitter<AuthState> emit) async {
    emit(const AuthVerifyCodeLoading());
    final response = await _verifyCodeUseCase(
      VerifyCodeUseCaseParams(
        email: event.email,
        code: event.code,
      ),
    );
    response.fold(
      (failure) => emit(AuthVerifyCodeFailure(failure.message!)),
      (_) => emit(const AuthVerifyCodeSuccess()),
    );
  }

  void _onAuthResendCode(
      AuthResendCodeEvent event, Emitter<AuthState> emit) async {
    emit(const AuthVerifyCodeLoading());
    final response = await _resendCodeUseCase(
      event.email,
    );
    response.fold(
      (failure) => emit(AuthResendCodeFailure(failure.message!)),
      (_) => emit(const AuthResendCodeSuccess()),
    );
  }
}
