import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_m_flutter/core/error/failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasource/auth_remote_data_source.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  AuthRepositoryImp({required AuthRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, void>> signUpWithNameEmailPassword({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      final response = await _remoteDataSource.signUpWithNameEmailPassword(
        name: name,
        email: email,
        password: password,
        phone: phone,
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _remoteDataSource.signInWithEmailPassword(
        email: email,
        password: password,
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> forgetPassword({
    required String email,
  }) async {
    try {
      final response = await _remoteDataSource.forgetPassword(
        email: email,
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({
    required String email,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      final response = await _remoteDataSource.resetPassword(
        email: email,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> verifyCode({
    required String email,
    required String code,
  }) async {
    try {
      final response = await _remoteDataSource.verifyCode(
        email: email,
        code: code,
      );
      return Right(response);
    } on DioException catch (e) {
    
      return Left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> resendCode({
    required String email,
  }) async {
    try {
      final response = await _remoteDataSource.resendCode(
        email: email,
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(Failure(message: e.message));
    }
  }
}
