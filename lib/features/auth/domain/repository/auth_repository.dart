import 'package:dartz/dartz.dart';
import 'package:e_commerce_m_flutter/core/error/failure.dart';

import '../entities/user.dart';

abstract interface class AuthRepository {
  //return Failure or user entity object
  Future<Either<Failure, void>> signUpWithNameEmailPassword({
    required String name,
    required String email,
    required String password,
    required String phone,
  });

  Future<Either<Failure, User>> signInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> forgetPassword({
    required String email,
  });

  Future<Either<Failure, void>> resetPassword({
    required String email,
    required String newPassword,
    required String confirmPassword,
  });

    Future<Either<Failure, void>> verifyCode({
    required String email,
    required String code,
  });

  Future<Either<Failure, void>> resendCode({
    required String email,
  });
}
