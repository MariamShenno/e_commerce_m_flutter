import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../config/theme/theme_mode_cache_helper.dart';

part 'theme_mode_state.dart';

class ThemeModeCubit extends Cubit<ChangeThemeModeState> {
  final ThemeModeCacheHelper _themeModeCacheHelper;
  ThemeModeCubit({required ThemeModeCacheHelper themeModeCacheHelper})
      : _themeModeCacheHelper = themeModeCacheHelper,
        super(ChangeThemeModeState(themeMode: ThemeMode.light));

  void getSavedThemeMode() {
    final String cachedThemeMode = _themeModeCacheHelper.getCachedThemeMode();
    // switch (cachedThemeMode) {
    //   case 'light':
    //     return emit(ChangeThemeModeState(themeMode: ThemeMode.light));
    //   case 'dark':
    //      emit(ChangeThemeModeState(themeMode: ThemeMode.dark));
    //   case 'system':
    //      emit(ChangeThemeModeState(themeMode: ThemeMode.system));
    // }
    if (cachedThemeMode == 'light') {
      emit(ChangeThemeModeState(themeMode: ThemeMode.light));
    } else if (cachedThemeMode == 'dark') {
      emit(ChangeThemeModeState(themeMode: ThemeMode.dark));
    } else if (cachedThemeMode == 'system') {
      emit(ChangeThemeModeState(themeMode: ThemeMode.system));
    }
  }

  void changeThemeMode(String thememode) {
    _themeModeCacheHelper.cacheThemeMode(thememode);

    // switch (thememode) {
    //   case 'light':
    //      emit(ChangeThemeModeState(themeMode: ThemeMode.light));
    //   case 'dark':
    //      emit(ChangeThemeModeState(themeMode: ThemeMode.dark));
    //   case 'system':
    //      emit(ChangeThemeModeState(themeMode: ThemeMode.system));
    // }

    if (thememode == 'light') {
      emit(ChangeThemeModeState(themeMode: ThemeMode.light));
    } else if (thememode == 'dark') {
      emit(ChangeThemeModeState(themeMode: ThemeMode.dark));
    } else if (thememode == 'system') {
      emit(ChangeThemeModeState(themeMode: ThemeMode.system));
    }
  }
}
