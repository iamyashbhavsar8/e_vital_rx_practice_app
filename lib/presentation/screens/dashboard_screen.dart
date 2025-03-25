import 'package:e_vital_rx/business_logic/dashboard_screen/dashboard_screen_cubit.dart';
import 'package:e_vital_rx/presentation/components/dashboard_components/dashboard_app_bar_flexible_container_view.dart';
import 'package:e_vital_rx/utils/colors.dart';
import 'package:e_vital_rx/utils/utils.dart';
import 'package:e_vital_rx/widgets/common_profile_view_widget.dart';
import 'package:e_vital_rx/widgets/text_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/data_model/data_model.dart';
import '../../model/filter_model/filter_model.dart';
import '../../utils/show_dialog.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<DataModel> dataModelList = <DataModel>[];
  List<DataModel> storeDataModelList = <DataModel>[];
  List<FilterModel> filterModelList = <FilterModel>[];
  DashboardScreenCubit? dashboardScreenCubit;
  bool isFilterApplied = false;

  @override
  void initState() {
    super.initState();
    dashboardScreenCubit = context.read<DashboardScreenCubit>();
    dashboardScreenCubit!.paginatedData();
    filterModelList = dashboardScreenCubit!.filterModelListInit();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: colorPrimary,
        statusBarIconBrightness: Brightness.light,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: projectWhite,
          body: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              sliverAppBar(),
              BlocConsumer<DashboardScreenCubit, DashboardScreenState>(
                listener: (context, state) {
                  if (state is GetDataFromHiveError) {
                    showSnackBar(state.error, context);
                  }
                },
                builder: (context, state) {
                  if (state is GetDataFromHiveLoading) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: colorPrimary,
                        ),
                      ),
                    );
                  }
                  if (state is GetDataFromHiveLoaded) {
                    dataModelList = state.dataModelList;
                    storeDataModelList = state.storeDataModelList;
                  }
                  return SliverPadding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    sliver: SliverList.separated(
                      itemCount: dataModelList.length + 1,
                      itemBuilder: (BuildContext context, int index) {
                        if (dataModelList.isNotEmpty) {
                          if (index == dataModelList.length) {
                            if (dataModelList.length <
                                storeDataModelList.length) {
                              Future.delayed(
                                const Duration(seconds: 1),
                                () => dashboardScreenCubit!.paginatedData(),
                              );
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              return Center(
                                child: TextView(
                                  data: "noMoreData".tr(),
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: fontGrey,
                                  ),
                                ),
                              );
                            }
                          }
                          return CommonProfileViewWidget(
                            storeDataModel: dataModelList[index],
                            dashboardScreenCubit: dashboardScreenCubit!,
                          );
                        } else {
                          return Container();
                        }
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 17.w),
                          child: Divider(
                            color: fontGrey,
                          ),
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: colorPrimary,
            child: Icon(
              Icons.filter_alt,
              color: projectWhite,
            ),
            onPressed: () async {
              showFilterSelectionDialog(
                context: context,
                onTapFilter: (index) {
                  dashboardScreenCubit!.filterAndSortUsers(
                    sortBy: filterModelList[index].name,
                    ascending: filterModelList[index].isAsc,
                  );
                },
                filterModelList: filterModelList,
              );
            },
          ),
        ),
      ),
    );
  }

  SliverAppBar sliverAppBar() {
    return SliverAppBar(
      expandedHeight: 120.h,
      collapsedHeight: 60.h,
      centerTitle: true,
      floating: true,
      pinned: true,
      backgroundColor: projectWhite,
      surfaceTintColor: projectWhite,
      flexibleSpace: const DashBoardAppBarFlexibleContainerView(),
    );
  }
}
