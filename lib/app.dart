// import 'package:device_preview/device_preview.dart';

import 'package:e_commerce_m_flutter/init_dependecies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/localization/app_localizations.dart';
import 'config/routes/app_route.dart';
import 'config/theme/theme.dart';
import 'core/cubits/locale/localization_cubit.dart';
import 'core/cubits/middleware/middleware_cubit.dart';
import 'core/cubits/theme_mode/theme_mode_cubit.dart';
import 'features/auth/presentation/bloc/auth/auth_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => sl<AuthBloc>(),
        ),
        BlocProvider<LocalizationCubit>(
          create: (context) => sl<LocalizationCubit>()..getSavedLanguage(),
        ),
        BlocProvider(
          create: (context) => sl<ThemeModeCubit>()..getSavedThemeMode(),
        ),
        // BlocProvider(
        //   create: (context) =>
        //       sl<NetworkConnectionCubit>()..monitorInternetConnection(),
        // ),
        BlocProvider(
          create: (contexxt) => sl<MiddlewareCubit>()..getSavedMiddlewarePage(),
        ),
      ],
      child: Builder(builder: (context) {
        final localizationCubit = context.watch<LocalizationCubit>().state;
        final thememodeCubit = context.watch<ThemeModeCubit>().state;
        final midddleWareCubit = context.watch<MiddlewareCubit>().state;
        ScreenUtil.init(context);

        return MaterialApp(
          //  builder: DevicePreview.appBuilder,
          title: 'e_commerce_m_flutter',
          themeMode: thememodeCubit.themeMode,
          theme: MAppTheme.lightTheme,
          darkTheme: MAppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          locale: localizationCubit.locale,

          // List all of the app's supported locales here
          supportedLocales: const [
            Locale('ar'),
            Locale('en'),
          ],
          // These delegates make sure that the localization
          // data for the proper language is loaded
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            // Built-in localization for text direction
            GlobalWidgetsLocalizations.delegate,
          ],
          initialRoute: '/',
         // midddleWareCubit.middlewarePage,
        onGenerateRoute: AppRoute.onGenerateRoute,
        );
      }),
    );
  }
}
