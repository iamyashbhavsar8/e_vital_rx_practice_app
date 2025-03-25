import 'package:e_vital_rx/business_logic/login_screen/login_screen_cubit.dart';
import 'package:e_vital_rx/presentation/components/login_component/app_bar_flexible_container_view.dart';
import 'package:e_vital_rx/presentation/components/login_component/login_button.dart';
import 'package:e_vital_rx/utils/colors.dart';
import 'package:e_vital_rx/widgets/stream_text_field.dart';
import 'package:e_vital_rx/widgets/text_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    required this.id,
    required this.utmCampaign,
    required this.utmSource,
    required this.utmMedium,
  });

  final String id;
  final String utmCampaign;
  final String utmSource;
  final String utmMedium;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenCubit? loginCubit;
  bool isAllUtmAvailable = false;
  bool isShowUtmValue = false;

  @override
  void initState() {
    super.initState();
    loginCubit = context.read<LoginScreenCubit>();
    isAllUtmAvailable = widget.id.isNotEmpty &&
        widget.utmCampaign.isNotEmpty &&
        widget.utmSource.isNotEmpty &&
        widget.utmMedium.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: colorPrimary,
        statusBarIconBrightness: Brightness.light,
      ),
      child: SafeArea(
        child: BlocBuilder<LoginScreenCubit, LoginScreenState>(
          builder: (context, state) {
            if (state is ShowUtmValueState) {
              isShowUtmValue = state.isShowUtmValue;
            }
            return Scaffold(
              backgroundColor: projectWhite,
              body: CustomScrollView(
                shrinkWrap: true,
                slivers: [
                  sliverAppBar(),
                  SliverPadding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 60.h),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextView(
                            data: "login".tr(),
                            style:
                                TextStyle(color: projectBlack, fontSize: 32.sp),
                          ),
                          SizedBox(height: 40.h),
                          StreamTextField(
                            stream: loginCubit!.userNameStream,
                            onChange: (value) {
                              loginCubit!.userNameValidate(value);
                            },
                            textLabel: "enterUserName".tr(),
                          ),
                          StreamTextField(
                            stream: loginCubit!.contactStream,
                            onChange: (value) {
                              loginCubit!.contactValidate(value);
                            },
                            textLabel: "enterPhoneNumber".tr(),
                            textInputType: TextInputType.number,
                          ),
                          StreamTextField(
                            stream: loginCubit!.passwordStream,
                            onChange: (value) {
                              loginCubit!.passwordValidate(value);
                            },
                            isHideEyeIcon: true,
                            textInputAction: TextInputAction.done,
                            textLabel: "enterPassword".tr(),
                          ),
                          LoginButton(loginCubit: loginCubit!),
                          SizedBox(height: 20.h),
                          Visibility(
                            visible: !isShowUtmValue && isAllUtmAvailable,
                            child: TextButton(
                              onPressed: () {
                                loginCubit!.updateShowUtmValue(
                                    isShowUtmValue: isShowUtmValue);
                              },
                              child: TextView(
                                data: "showUtmValue".tr(),
                                style: TextStyle(color: colorPrimary),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: isShowUtmValue,
                            child: Column(
                              children: [
                                commonUtmValueShowView("Id", widget.id),
                                commonUtmValueShowView(
                                    "utmMedium", widget.utmCampaign),
                                commonUtmValueShowView(
                                    "utmSource", widget.utmSource),
                                commonUtmValueShowView(
                                    "utmMedium", widget.utmMedium),
                                TextButton(
                                  onPressed: () {
                                    loginCubit!.updateShowUtmValue(
                                        isShowUtmValue: isShowUtmValue);
                                  },
                                  child: TextView(
                                    data: "hideUtmValue".tr(),
                                    style: TextStyle(color: colorPrimary),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  SliverAppBar sliverAppBar() {
    return SliverAppBar(
      expandedHeight: 60.h,
      collapsedHeight: 60.h,
      centerTitle: true,
      floating: true,
      pinned: true,
      backgroundColor: projectWhite,
      surfaceTintColor: projectWhite,
      flexibleSpace: const AppBarFlexibleContainerView(),
    );
  }

  Widget commonUtmValueShowView(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextView(
          data: uppercase("$title :"),
          style: TextStyle(color: projectBlack),
        ),
        TextView(
          data: value,
          style: TextStyle(color: projectBlack),
        ),
      ],
    );
  }
}
