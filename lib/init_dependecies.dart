import 'package:dio/dio.dart';
import 'package:e_commerce_m_flutter/config/localization/language_cache_helper.dart';
import 'package:e_commerce_m_flutter/core/cubits/locale/localization_cubit.dart';
import 'package:e_commerce_m_flutter/features/onBoarding/data/datasource/static/onboarding_local_data.dart';
import 'package:e_commerce_m_flutter/features/onBoarding/data/repository/onboarding_repository_imp.dart';
import 'package:e_commerce_m_flutter/features/onBoarding/domain/repository/onboarding_repository.dart';
import 'package:e_commerce_m_flutter/features/onBoarding/domain/usecases/onboarding_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/middle_ware/middelware_cache_helper.dart';
import 'config/theme/theme_mode_cache_helper.dart';
import 'core/cubits/middleware/middleware_cubit.dart';
import 'core/cubits/theme_mode/theme_mode_cubit.dart';
import 'features/auth/data/datasource/auth_remote_data_source.dart';
import 'features/auth/data/repository/auth_repository_imp.dart';
import 'features/auth/domain/repository/auth_repository.dart';
import 'features/auth/domain/usecase/forget_password_use_case.dart';
import 'features/auth/domain/usecase/resend_code_use_case.dart';
import 'features/auth/domain/usecase/reset_password_use_case.dart';
import 'features/auth/domain/usecase/user_login_use_case.dart';
import 'features/auth/domain/usecase/user_sign_up_use_case.dart';
import 'features/auth/domain/usecase/verify_code_use_case.dart';
import 'features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'features/onBoarding/presentation/bloc/on_boarding_cubit/on_boarding_cubit.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  /// dio
  sl.registerLazySingleton<Dio>(() => Dio());

  /// Hive (Local Storage)
  // Hive.init((await getApplicationDocumentsDirectory()).path);
  // final userBox = await Hive.openBox("userBox");
  // sl.registerLazySingleton(() => userBox);

  /// SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  ///// core & config /////

  /// MIDDLEWARE-->
  /// config/MiddlewareCacheHelper
  sl.registerFactory(() => MiddlewareCacheHelper(sharedPreferences: sl()));

  /// core/Middleware-cubit
  sl.registerLazySingleton(() => MiddlewareCubit(middlewareCacheHelper: sl()));

  /// INTERNET-CONNECTION-->
  /// core/network-cubit
  //sl.registerFactory(() => NetworkConnectionCubit());

  /// LOCALIZATION-->

  /// config \ LanguageCacheHelper
  sl.registerLazySingleton(() => LanguageCacheHelper(sharedPreferences: sl()));

  /// core \ Localization-cubit
  sl.registerLazySingleton(() => LocalizationCubit(languageCacheHelper: sl()));

  /// THEME_MODE-->

  /// config/ThemeModeCacheHelper
  sl.registerFactory(() => ThemeModeCacheHelper(sharedPreferences: sl()));

  /// core/ThemeMode-cubit
  sl.registerLazySingleton(() => ThemeModeCubit(themeModeCacheHelper: sl()));

  /// on-boarding
  _initOnBoarding();

  /// initAuth()
  _initAuth();
}

_initOnBoarding() {
  /// data sources
  sl
    ..registerFactory<OnBoardingLocalData>(
      () => const OnBoardingLocalDataImp(),
    )

    /// repository
    ..registerFactory<OnBoardingRepository>(
      () => OnBoardingRepositoryImp(onBoardingLocalData: sl()),
    )

    /// use cases
    ..registerFactory(
      () => OnboardingUseCase(onBoardingRepository: sl()),
    )

    /// bloc
    ..registerLazySingleton<OnBoardingCubit>(
      () => OnBoardingCubit(onboardingUseCase: sl()),
    );
}

void _initAuth() {
  /// data sources
  sl
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImp(dio: sl()),
    )

    /// repository
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImp(remoteDataSource: sl()),
    )

    /// use cases
    ..registerFactory(
      () => UserSignUpUseCase(authRepository: sl()),
    )
    ..registerFactory(
      () => UserLoginUseCase(authRepository: sl()),
    )
    ..registerFactory(
      () => ForgetPasswordUseCase(authRepository: sl()),
    )
    ..registerFactory(
      () => ResetPasswordUseCase(authRepository: sl()),
    )
    ..registerFactory(
      () => VerifyCodeUseCase(authRepository: sl()),
    )
    ..registerFactory(
      () => ResendCodeUseCase(authRepository: sl()),
    )

    /// bloc
    ..registerLazySingleton<AuthBloc>(
      () => AuthBloc(
        userSignUpUseCase: sl(),
        userLoginUseCase: sl(),
        forgetPasswordUseCase: sl(),
        resetPasswordUseCase: sl(),
        verifyCodeUseCase: sl(),
        resendCodeUseCase: sl(),
      ),
    );
}
