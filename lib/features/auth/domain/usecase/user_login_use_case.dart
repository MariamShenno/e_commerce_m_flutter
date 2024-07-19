import 'package:dartz/dartz.dart';
import 'package:e_commerce_m_flutter/core/error/failure.dart';
import 'package:e_commerce_m_flutter/core/use_cases/use_case.dart';
import '../entities/user.dart';
import '../repository/auth_repository.dart';

class UserLoginUseCase implements UseCase<User, UserLoginUsecaseParams> {
  final AuthRepository _authRepository;

  UserLoginUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Either<Failure, User>> call(UserLoginUsecaseParams params) async {
    return await _authRepository.signInWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLoginUsecaseParams {
  final String email;
  final String password;

  UserLoginUsecaseParams({
    required this.email,
    required this.password,
  });
}
