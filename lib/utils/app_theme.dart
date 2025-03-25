import 'package:flutter/material.dart';

import 'colors.dart';


class AppTheme {
  AppTheme._();

  static String get poppinsFamily => 'Poppins';

  static final ThemeData lightTheme = ThemeData(
    fontFamily: poppinsFamily,
    brightness: Brightness.light,
    primaryColor: colorPrimary,
    scaffoldBackgroundColor: projectWhite,
    primaryTextTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 57,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
      ),
      headlineLarge: TextStyle(
        fontSize: 32,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
      ),
    ),
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    fontFamily: poppinsFamily,
    brightness: Brightness.dark,
    primaryColor: colorPrimary,
    scaffoldBackgroundColor: projectWhite,
    primaryTextTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 57,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
      ),
      headlineLarge: TextStyle(
        fontSize: 32,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
      ),
    ),
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}
