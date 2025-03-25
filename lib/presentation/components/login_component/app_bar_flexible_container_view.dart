import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';

class AppBarFlexibleContainerView extends StatelessWidget {
  const AppBarFlexibleContainerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colorGradient1, colorGradient2],
        ),
      ),
      child: Image.asset(
        eVitalRxLogo,
        height: 60.h,
      ),
    );
  }
}
