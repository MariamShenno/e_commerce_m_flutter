import 'package:dartz/dartz.dart';
import 'package:e_commerce_m_flutter/core/error/failure.dart';
import 'package:e_commerce_m_flutter/core/use_cases/use_case.dart';
import '../repository/auth_repository.dart';

class ResetPasswordUseCase
    implements UseCase<void, ResetPasswordUseCaseParams> {
  final AuthRepository _authRepository;

  ResetPasswordUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Either<Failure, void>> call(ResetPasswordUseCaseParams params) async {
    return await _authRepository.resetPassword(
      email: params.email,
      newPassword: params.newPassword,
      confirmPassword: params.confirmPassword
    );
  }
}

class ResetPasswordUseCaseParams {
  final String email;
  final String newPassword;
  final String confirmPassword;

  ResetPasswordUseCaseParams({
    required this.email,
    required this.newPassword,
    required this.confirmPassword
  });
}
