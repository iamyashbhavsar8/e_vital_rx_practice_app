import 'dart:developer';

import 'package:e_vital_rx/presentation/screens/dashboard_screen.dart';
import 'package:e_vital_rx/presentation/screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../business_logic/dashboard_screen/dashboard_screen_cubit.dart';
import '../business_logic/login_screen/login_screen_cubit.dart';
import '../business_logic/splash/splash_cubit.dart';
import '../business_logic/store_data/store_data_cubit.dart';
import '../presentation/screens/login_screen.dart';

import '../utils/constants.dart';

GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: '/',
      path: '/',
      builder: (context, state) {
        final splashCubit = SplashCubit();
        final storeDataCubit = StoreDataCubit();
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: splashCubit),
            BlocProvider.value(value: storeDataCubit),
          ],
          child: const SplashScreen(),
        );
      },
    ),
    GoRoute(
      name: loginScreen,
      path: loginScreen,
      builder: (context, state) {
        final loginCubit = LoginScreenCubit();
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: loginCubit),
          ],
          child: const LoginScreen(
            id: "",
            utmCampaign: '',
            utmSource: '',
            utmMedium: '',
          ),
        );
      },
    ),
    GoRoute(
      name: loginScreenWithData,
      // path: loginScreenWithData,
      path: '$loginScreenWithData/:id/:utm_campaign/:utm_source/:utm_medium',
      builder: (context, state) {
        log(state.fullPath.toString());
        log(state.pathParameters.toString());
        log(state.uri.toString());
        final loginCubit = LoginScreenCubit();
        String? id = state.pathParameters['id'];
        String? utmCampaign = state.pathParameters['utm_campaign'];
        String? utmSource = state.pathParameters['utm_source'];
        String? utmMedium = state.pathParameters['utm_medium'];
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: loginCubit),
          ],
          child: LoginScreen(
            id: id ?? "",
            utmCampaign: utmCampaign ?? "",
            utmSource: utmSource ?? "",
            utmMedium: utmMedium ?? "",
          ),
        );
      },
    ),
    GoRoute(
      name: dashBoardScreen,
      path: dashBoardScreen,
      builder: (context, state) {
        final dashBoardCubit = DashboardScreenCubit();
        final storeDataCubit = StoreDataCubit();
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: dashBoardCubit),
            BlocProvider.value(value: storeDataCubit),
          ],
          child: const DashBoardScreen(),
        );
      },
    ),
  ],
);
