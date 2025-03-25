import 'package:e_vital_rx/widgets/text_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../business_logic/dashboard_screen/dashboard_screen_cubit.dart';
import '../model/data_model/data_model.dart';
import '../utils/show_dialog.dart';
import '../utils/colors.dart';
import '../utils/utils.dart';

class CommonProfileViewWidget extends StatelessWidget {
  const CommonProfileViewWidget({
    super.key,
    required this.storeDataModel,
    required this.dashboardScreenCubit,
  });

  final DataModel storeDataModel;
  final DashboardScreenCubit dashboardScreenCubit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        dashboardScreenCubit.setRupee(rupee: storeDataModel.rupee.toString());
        showRupeeUpdateDialog(
          context: context,
          dataModel: storeDataModel,
          dashboardScreenCubit: dashboardScreenCubit,
          onUpdateTap: () {
            if (int.parse(dashboardScreenCubit.rupeeController.value) > 0 &&
                int.parse(dashboardScreenCubit.rupeeController.value) <= 100) {
              dashboardScreenCubit.updateRupeeById(
                id: storeDataModel.id,
              );
            } else {
              showSnackBar("rupeeValidation".tr(), context);
            }
          },
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
        padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: fontGrey, width: 1),
          color: storeDataModel.rupee > 50
              ? Colors.red.shade50
              : Colors.green.shade50,
        ),
        child: Row(
          children: [
            Container(
              height: 70.h,
              width: 70.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: fontGrey,
                image: DecorationImage(
                  image: NetworkImage(storeDataModel.userProfile),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    data: storeDataModel.name,
                    style: TextStyle(
                      color: projectBlack,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextView(
                    data: storeDataModel.phoneNumber.toString(),
                    style: TextStyle(
                      color: projectGrey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextView(
                    data: storeDataModel.city,
                    style: TextStyle(
                      color: projectGrey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Icon(
                  storeDataModel.rupee < 50
                      ? Icons.arrow_circle_down_sharp
                      : Icons.arrow_circle_up_sharp,
                  color: storeDataModel.rupee < 50 ? Colors.green : Colors.red,
                  size: 30.h,
                ),
                TextView(
                  data: storeDataModel.rupee < 50 ? "Low" : "High",
                  style: TextStyle(
                    color: projectGrey,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
