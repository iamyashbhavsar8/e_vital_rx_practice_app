import 'package:e_vital_rx/widgets/text_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../business_logic/login_screen/login_screen_cubit.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.loginCubit,
  });

  final LoginScreenCubit loginCubit;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: loginCubit.validateSignUpForm,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              if (snapshot.hasData) {
                if (loginCubit.contactController.value == "9033006262" &&
                    loginCubit.passwordController.value == "eVital@12") {
                  context.go(dashBoardScreen);
                  showSnackBar(
                    "Welcome ${loginCubit.userNameController.value}",
                    context,
                  );
                } else {
                  showSnackBar("unAuthorized".tr(), context);
                }
              } else {
                showSnackBar("fieldRequired".tr(), context);
              }
            },
            child: Container(
              height: 40.h,
              width: 220.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [colorGradient1, colorGradient2],
                ),
              ),
              child: TextView(
                data: uppercase("login".tr()),
                style: TextStyle(
                  color: projectWhite,
                ),
              ),
            ),
          );
        });
  }
}
