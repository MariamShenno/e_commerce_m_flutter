import 'package:dio/dio.dart';
import '../../../../common/utils/constants/api_secret.dart';
import '../../../../core/error/handling_error/auth_exceptions.dart';
import '../model/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<void> signUpWithNameEmailPassword({
    required String name,
    required String email,
    required String password,
    required String phone,
  });

  Future<UserModel> signInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<void> forgetPassword({
    required String email,
  });

  Future<void> resetPassword({
    required String email,
    required String newPassword,
    required String confirmPassword,
  });

  Future<void> verifyCode({
    required String email,
    required String code,
  });

  Future<void> resendCode({
    required String email,
  });
}

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImp({
    required this.dio,
  });

  @override
  Future<void> signUpWithNameEmailPassword({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      // dio request
   await dio.post(
        AppLink.signUp,
        data: FormData.fromMap({
          "userName": name,
          "userEmail": email,
          "userPassword": password,
          "userPhone": phone,
        }),
      );
    } on DioException catch (e) {
      
      AuthException.signUpException(e);
    }
  }

  @override
  Future<UserModel> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        AppLink.login,
        data: FormData.fromMap(
          {
            "userEmail": email,
            "userPassword": password,
          },
        ),
      );
      return UserModel.fromJson(
        response.data['response']);
    } on DioException catch (e) {
      throw AuthException.logInException(e);
    }
  }

  @override
  Future<void> forgetPassword({
    required String email,
  }) async {
    try {
      await dio.post(
        AppLink.forgetPassword,
        data: FormData.fromMap({
          "userEmail": email,
        }),
      );
    } on DioException catch (e) {
      AuthException.forgetPassException(e);
    }
  }

  @override
  Future<void> resetPassword({
    required String email,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      await dio.post(
        AppLink.resetPassword,
        data: FormData.fromMap({
          "userEmail": email,
          "newPassword": newPassword,
          "confirmPassword": confirmPassword,
        }),
      );
    } on DioException catch (e) {
      AuthException.resetPassException(e);
    }
  }

  @override
  Future<void> verifyCode({
    required String email,
    required String code,
  }) async {
    try {
      await dio.post(
        AppLink.verfiyCode,
        data: FormData.fromMap({
          "userEmail": email,
          "userVerifyCode": code,
        }),
      );
    } on DioException catch (e) {
      AuthException.verifyCodeException(e);
    }
  }

  @override
  Future<void> resendCode({
    required String email,
  }) async {
    try {
      await dio.post(
        AppLink.resendCode,
        data: FormData.fromMap({
          "userEmail": email,
        }),
      );
    } on DioException catch (e) {
      AuthException.resendCodeException(e);
    }
  }
}
