// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:e_commerce_m_flutter/core/error/failure.dart';

import '../../../../core/use_cases/use_case.dart';
import '../repository/auth_repository.dart';

class UserSignUpUseCase implements UseCase<void, UserSignUpUseCaseParams> {
  final AuthRepository _authRepository;
  UserSignUpUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Either<Failure, void>> call(UserSignUpUseCaseParams params) async {
    return await _authRepository.signUpWithNameEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
      phone: params.phone,
    );
  }
}

class UserSignUpUseCaseParams {
  final String name;
  final String email;
  final String password;
  final String phone;
  UserSignUpUseCaseParams({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });
}
