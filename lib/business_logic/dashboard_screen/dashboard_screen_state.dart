part of 'dashboard_screen_cubit.dart';

sealed class DashboardScreenState {}

final class DashboardScreenInitial extends DashboardScreenState {}

class GetDataFromHiveLoading extends DashboardScreenState {}

class GetDataFromHiveLoaded extends DashboardScreenState {
  List<DataModel> dataModelList;
  List<DataModel> storeDataModelList;

  GetDataFromHiveLoaded(
    this.dataModelList,
    this.storeDataModelList,
  );
}

class GetDataFromHiveError extends DashboardScreenState {
  String error;

  GetDataFromHiveError(this.error);
}
