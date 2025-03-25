import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:e_vital_rx/business_logic/theme/theme_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_theme.dart';
import '../../utils/constants.dart';
import '../../utils/shared_preferences.dart';

part 'theme_state.dart';

bool isDarkMode = false;
bool isGlobeVisible = false;

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(this.context) : super(ThemeState(isDarkTheme: false)) {
    getAppTheme(context);
  }

  final BuildContext context;
  Brightness? brightness;
  int? currentVal = 2;
  int? secondValue = 500;

  List<ThemeModel> getSelectedTheme(BuildContext context) {
    var themeList = [
      getThemes(
          themeId: themeModeDark,
          themeType: 'dark',
          iconData: CupertinoIcons.moon_circle),
      getThemes(
          themeId: themeModeLight,
          themeType: 'light',
          iconData: CupertinoIcons.sun_max),
      getThemes(
          themeId: themeModeSystem,
          themeType: 'systemDefault',
          iconData: CupertinoIcons.device_phone_portrait),
    ];
    return themeList;
  }

  void getAppTheme(BuildContext context) {
    Timer(Duration(milliseconds: secondValue!), () async {
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) {
          var selectedThemeType = PrefUtil.getValue(selectedTheme, 2);
          if (selectedThemeType == themeModeDark) {
            brightness = Brightness.dark;
            currentVal = themeModeDark;
          } else if (selectedThemeType == themeModeLight) {
            brightness = Brightness.light;
            currentVal = themeModeLight;
          } else {
            brightness = PlatformDispatcher.instance.platformBrightness;
            currentVal = themeModeSystem;
          }
          commonThemeSetting(brightness!);
          setConfigureBrightness();
        },
      );
    });
  }

  void setConfigureBrightness() {
    var platformBrightness = PlatformDispatcher.instance;
    platformBrightness.onPlatformBrightnessChanged = () {
      WidgetsBinding.instance.handlePlatformBrightnessChanged();
      // This callback is called every time the brightness changes.
      brightness = platformBrightness.platformBrightness;
      if (currentVal == themeModeSystem) {
        commonThemeSetting(brightness!);
      }
    };
  }

  void commonThemeSetting(Brightness brightness) {
    if (brightness == Brightness.light) {
      setTheme(false);
    } else {
      setTheme(true);
    }
  }

  void setTheme(bool brightness) {
    if (brightness) {
      isDarkMode = true;
      // themeChangedEvent(
      //     {"Theme_Selected": "Dark", "user_id": userModel.authId});
      emit(ThemeState(isDarkTheme: isDarkMode));
    } else {
      isDarkMode = false;
      if (!isClosed) emit(ThemeState(isDarkTheme: isDarkMode));
    }
  }

  void showAnim(bool bool) {
    isGlobeVisible = bool;
    emit(GlobeVisible(isDarkTheme: isDarkMode));
  }

  ThemeModel getThemes({int? themeId, String? themeType, IconData? iconData}) {
    return ThemeModel(
      themeId: themeId,
      themeType: themeType!.tr(),
      themeIcon: iconData,
    );
  }
}
