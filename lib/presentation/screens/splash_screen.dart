import 'package:e_vital_rx/business_logic/splash/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../business_logic/store_data/store_data_cubit.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashCubit? splashCubit;
  bool isHaveData = false;
  StoreDataCubit? storeDataCubit;

  @override
  void initState() {
    super.initState();
    splashCubit = context.read<SplashCubit>();
    storeDataCubit = context.read<StoreDataCubit>();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    isHaveData = await splashCubit!.getDataFromHive();
    isHaveData ? null : storeDataCubit!.storeDateInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: projectWhite,
      body: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is PushReplacementPage) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              context.go(loginScreen);
            });
          }
          return Center(
            child: Image.asset(
              eVitalRxLogo,
            ),
          );
        },
      ),
    );
  }
}
