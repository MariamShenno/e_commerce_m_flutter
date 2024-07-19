import 'package:dartz/dartz.dart';
import 'package:e_commerce_m_flutter/core/error/failure.dart';
import 'package:e_commerce_m_flutter/core/use_cases/use_case.dart';
import '../repository/auth_repository.dart';

class ResendCodeUseCase implements UseCase<void, String> {
  final AuthRepository _authRepository;

  ResendCodeUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Either<Failure, void>> call(String params) async {
    return await _authRepository.resendCode(
      email: params,
    );
  }
}

