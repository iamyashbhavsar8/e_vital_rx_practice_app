// import 'package:e_vital_rx/business_logic/store_data/store_data_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../business_logic/dashboard_screen/dashboard_screen_cubit.dart';
// import '../business_logic/login_screen/login_screen_cubit.dart';
// import '../business_logic/splash/splash_cubit.dart';
// import '../presentation/screens/dashboard_screen.dart';
// import '../presentation/screens/login_screen.dart';
// import '../presentation/screens/splash_screen.dart';
// import '../utils/constants.dart';
//
// class AppRouter {
//   final storeDataCubit = StoreDataCubit();
//
//   Route generateRoute(RouteSettings routeSettings) {
//     switch (routeSettings.name) {
//       case '/':
//         final splashCubit = SplashCubit();
//         return PageRouteBuilder(
//           pageBuilder: (context, animation, secondaryAnimation) {
//             return MultiBlocProvider(
//               providers: [
//                 BlocProvider.value(value: splashCubit),
//                 BlocProvider.value(value: storeDataCubit),
//               ],
//               child: const SplashScreen(),
//             );
//           },
//           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//             return getSlideTransition(animation, child);
//           },
//           fullscreenDialog: true,
//         );
//
//       case loginScreen:
//         final loginCubit = LoginScreenCubit();
//         return PageRouteBuilder(
//           pageBuilder: (context, animation, secondaryAnimation) {
//             return MultiBlocProvider(
//               providers: [
//                 BlocProvider.value(value: loginCubit),
//                 BlocProvider.value(value: storeDataCubit),
//               ],
//               child: const LoginScreen(),
//             );
//           },
//           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//             return getSlideTransition(animation, child);
//           },
//           fullscreenDialog: true,
//         );
//
//       case dashBoardScreen:
//         final dashBoardCubit = DashboardScreenCubit();
//         return PageRouteBuilder(
//           pageBuilder: (context, animation, secondaryAnimation) {
//             return MultiBlocProvider(
//               providers: [
//                 BlocProvider.value(value: dashBoardCubit),
//                 BlocProvider.value(value: storeDataCubit),
//               ],
//               child: const DashBoardScreen(),
//             );
//           },
//           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//             return getSlideTransition(animation, child);
//           },
//           fullscreenDialog: true,
//         );
//
//       default:
//         final splashCubit = SplashCubit();
//         return PageRouteBuilder(
//           pageBuilder: (context, animation, secondaryAnimation) {
//             return BlocProvider.value(
//               value: splashCubit,
//               child: const SplashScreen(),
//             );
//           },
//           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//             return getSlideTransition(animation, child);
//           },
//           fullscreenDialog: true,
//         );
//     }
//   }
// }
//
// FadeTransition getFadeTransition(Animation<double> animation, Widget child) {
//   animation = CurvedAnimation(curve: Curves.easeIn, parent: animation);
//
//   return FadeTransition(opacity: animation, child: child);
// }
//
// SlideTransition getSlideTransition(Animation<double> animation, Widget child) {
//   const begin = Offset(0.0, 1.0);
//   const end = Offset.zero;
//   const curve = Curves.ease;
//
//   var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//
//   return SlideTransition(
//     position: animation.drive(tween),
//     child: child,
//   );
// }
