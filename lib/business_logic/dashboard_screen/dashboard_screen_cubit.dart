import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:rxdart/rxdart.dart';

import '../../model/data_model/data_model.dart';
import '../../model/filter_model/filter_model.dart';
import '../../utils/constants.dart';
import '../../utils/hive_db.dart';

part 'dashboard_screen_state.dart';

class DashboardScreenCubit extends Cubit<DashboardScreenState> {
  DashboardScreenCubit() : super(DashboardScreenInitial());

  Box? box;
  int page = 0;
  int pageGet = 20;
  List<DataModel> storeDataModelList = [];
  List<DataModel> dataModelList = [];
  final rupeeController = BehaviorSubject<String>();

  Stream<String> get rupeeStream => rupeeController.stream;

  getStoredDataFromHive() async {
    box = await HiveDb().openOrGetBox();
    List<dynamic> getData = await box!.get(hiveData);
    storeDataModelList = getData.map((e) => e as DataModel).toList();
  }

  paginatedData() async {
    emit(GetDataFromHiveLoading());
    try {
      await getStoredDataFromHive();
      final startIndex = page * pageGet;
      final endIndex = startIndex + pageGet;
      if (startIndex < storeDataModelList.length) {
        dataModelList.addAll(storeDataModelList.sublist(
            startIndex, endIndex.clamp(0, storeDataModelList.length)));
        page++;
      }
      emit(GetDataFromHiveLoaded(dataModelList, storeDataModelList));
    } catch (e) {
      emit(GetDataFromHiveError("somethingWentWrong".tr()));
    }
  }

  updateRupeeById({required int id}) async {
    try {
      box = await HiveDb().openOrGetBox();
      dataModelList
          .map((DataModel e) =>
              e.id == id ? e.rupee = int.parse(rupeeController.value) : null)
          .toList();
      storeDataModelList
          .map((DataModel e) =>
              e.id == id ? e.rupee = int.parse(rupeeController.value) : null)
          .toList();
      box!.put(hiveData, storeDataModelList);
      emit(GetDataFromHiveLoaded(dataModelList, storeDataModelList));
    } catch (e) {
      emit(GetDataFromHiveError("somethingWentWrong".tr()));
    }
  }

  void rupeeValidate({required String rupee}) {
    rupeeController.sink.add(rupee);
  }

  TextEditingController? controllerRupee;

  setRupee({required String rupee}) {
    controllerRupee = TextEditingController(text: rupee);
    rupeeController.sink.add(rupee.isEmpty ? "" : rupee);
  }

  filterAndSortUsers({
    String searchQuery = "",
    String sortBy = "",
    bool ascending = true,
  }) {
    getStoredDataFromHive();
    List<DataModel> filteredUsers = storeDataModelList.where((user) {
      if (searchQuery.isEmpty) return true;
      final query = searchQuery.toLowerCase();
      return user.name.toLowerCase().contains(query) ||
          user.city.toLowerCase().contains(query) ||
          user.phoneNumber.toString().contains(query);
    }).toList();

    if (sortBy.isNotEmpty) {
      filteredUsers.sort(
        (a, b) {
          int comparison = 0;
          switch (sortBy.toLowerCase()) {
            case "name":
              comparison = a.name.compareTo(b.name);
              break;
            case "city":
              comparison = a.city.compareTo(b.city);
              break;
            case 'number':
              comparison = a.phoneNumber.compareTo(b.phoneNumber);
              break;
          }
          return ascending ? comparison : -comparison;
        },
      );
    }

    // Step 3: Implement Pagination
    int startIndex = page * pageGet;
    int endIndex = startIndex + pageGet;
    filteredUsers.sublist(startIndex, endIndex.clamp(0, filteredUsers.length));
    emit(GetDataFromHiveLoaded(filteredUsers, storeDataModelList));
  }

  filterModelListInit() {
    return [
      FilterModel(
        id: 0,
        name: "Name",
        isAsc: true,
      ),
      FilterModel(
        id: 1,
        name: "Name",
        isAsc: false,
      ),
      FilterModel(
        id: 2,
        name: "City",
        isAsc: true,
      ),
      FilterModel(
        id: 3,
        name: "City",
        isAsc: false,
      ),
      FilterModel(
        id: 4,
        name: "Number",
        isAsc: true,
      ),
      FilterModel(
        id: 5,
        name: "Number",
        isAsc: false,
      ),
    ];
  }
}
