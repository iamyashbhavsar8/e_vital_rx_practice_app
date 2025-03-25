part of 'theme_cubit.dart';

class ThemeState {
  ThemeData? themeData;
  bool isDarkTheme;

  ThemeState({required this.isDarkTheme}) {
    if (isDarkTheme) {
      themeData = AppTheme.darkTheme;
    } else {
      themeData = AppTheme.lightTheme;
    }
  }
}

class GlobeVisible extends ThemeState {
  GlobeVisible({required super.isDarkTheme});
}
