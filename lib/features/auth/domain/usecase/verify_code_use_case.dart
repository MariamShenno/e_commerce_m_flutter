import 'package:dartz/dartz.dart';
import 'package:e_commerce_m_flutter/core/error/failure.dart';
import 'package:e_commerce_m_flutter/core/use_cases/use_case.dart';
import '../repository/auth_repository.dart';

class VerifyCodeUseCase implements UseCase<void, VerifyCodeUseCaseParams> {
  final AuthRepository _authRepository;

  VerifyCodeUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Either<Failure, void>> call(VerifyCodeUseCaseParams params) async {
    return await _authRepository.verifyCode(
      email: params.email,
      code: params.code,
    );
  }
}

class VerifyCodeUseCaseParams {
  final String email;
  final String code;

  VerifyCodeUseCaseParams({
    required this.email,
    required this.code,
  });
}
