import 'package:dartz/dartz.dart';
import 'package:e_commerce_m_flutter/core/error/failure.dart';
import 'package:e_commerce_m_flutter/core/use_cases/use_case.dart';
import '../repository/auth_repository.dart';

class ForgetPasswordUseCase implements UseCase<void, String> {
  final AuthRepository _authRepository;

  ForgetPasswordUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Either<Failure, void>> call(String params) async {
    return await _authRepository.forgetPassword(
      email: params,
    );
  }
}


