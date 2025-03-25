import 'package:e_vital_rx/widgets/text_form_fields.dart';
import 'package:e_vital_rx/widgets/text_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../business_logic/dashboard_screen/dashboard_screen_cubit.dart';
import '../model/data_model/data_model.dart';
import '../model/filter_model/filter_model.dart';
import 'colors.dart';

showRupeeUpdateDialog({
  required BuildContext context,
  required DataModel dataModel,
  required DashboardScreenCubit dashboardScreenCubit,
  required Function onUpdateTap,
}) async {
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      surfaceTintColor: projectWhite,
      backgroundColor: projectWhite,
      title: Padding(
        padding: EdgeInsets.only(top: 15.h),
        child: TextView(
          data: dataModel.name,
          style: TextStyle(color: projectBlack, fontSize: 16.sp),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            child: StreamBuilder(
              stream: dashboardScreenCubit.rupeeStream,
              builder: (context, snapshot) {
                return TextFormFields(
                  controller: dashboardScreenCubit.controllerRupee,
                  textLabel: "updateRupee".tr(),
                  onSomeChanged: (value) =>
                      dashboardScreenCubit.rupeeValidate(rupee: value),
                  textInputType: TextInputType.number,
                );
              },
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: TextView(
                  data: "cancel".tr(),
                  style: TextStyle(
                    color: backGroundColor,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: backGroundColor),
                onPressed: () {
                  Navigator.of(context).pop();
                  onUpdateTap();
                },
                child: TextView(
                  data: "update".tr(),
                  style: TextStyle(
                    color: projectWhite,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

showFilterSelectionDialog({
  required BuildContext context,
  required Function(int) onTapFilter,
  required List<FilterModel> filterModelList,
}) async {
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      surfaceTintColor: projectWhite,
      backgroundColor: projectWhite,
      title: TextView(
        data: "eVital".tr(),
        style: TextStyle(color: projectBlack, fontSize: 18.sp),
      ),
      content: SizedBox(
        height: 180.h,
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).pop();
                onTapFilter(index);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextView(
                    data: filterModelList[index].name,
                    style: TextStyle(color: projectBlack),
                    align: TextAlign.start,
                  ),
                  TextView(
                    data: filterModelList[index].isAsc ? "Asc" : "Desc",
                    style: TextStyle(color: projectBlack),
                    align: TextAlign.start,
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Divider(
                thickness: 1,
                color: fontGrey,
              ),
            );
          },
          itemCount: filterModelList.length,
        ),
      ),
    ),
  );
}
