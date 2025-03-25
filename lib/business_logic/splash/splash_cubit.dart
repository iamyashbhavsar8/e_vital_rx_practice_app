import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_vital_rx/utils/hive_db.dart';
import 'package:hive/hive.dart';

import '../../utils/constants.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial()) {
    pushReplacementPage();
  }

  Box? box;

  getDataFromHive() async {
    box = await HiveDb().openOrGetBox();
    var storeDataModelList = box!.get(hiveData);
    return storeDataModelList == null ? false : true;
  }

  pushReplacementPage() async {
    Timer(const Duration(seconds: 3), () {
      emit(PushReplacementPage());
    });
  }
}
