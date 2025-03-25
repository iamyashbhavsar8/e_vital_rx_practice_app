import 'package:e_vital_rx/router/go_route.dart';
import 'package:e_vital_rx/utils/hive_db.dart';
import 'package:e_vital_rx/utils/utm_commons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'business_logic/theme/theme_cubit.dart';
import 'utils/firebase_commons.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseCommons.firebaseInit();
  await HiveDb().hiveInit();
  await UtmCommons.initUniLinks();

  await EasyLocalization.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
        ],
        path: 'assets/translations',
        child: EVitalRx(),
      ),
    ),
  );
}

class EVitalRx extends StatelessWidget {
  EVitalRx({
    super.key,
    // required this.router,
  });

  // final AppRouter? router;
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (BuildContext context, Widget? child) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeCubit(context),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeState) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: themeState.themeData,
              routerConfig: router,
              themeAnimationCurve: Curves.elasticIn,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              scaffoldMessengerKey: rootScaffoldMessengerKey,
            );
            // return MaterialApp(
            //   debugShowCheckedModeBanner: false,
            //   onGenerateRoute: router!.generateRoute,
            //   theme: themeState.themeData,
            //   themeAnimationCurve: Curves.elasticIn,
            //   localizationsDelegates: context.localizationDelegates,
            //   supportedLocales: context.supportedLocales,
            //   locale: context.locale,
            //   navigatorKey: navigatorKey,
            //   scaffoldMessengerKey: rootScaffoldMessengerKey,
            // );
          },
        ),
      );
    });
  }
}

// flutter pub run easy_localization:generate --source-dir ./assets/translations
