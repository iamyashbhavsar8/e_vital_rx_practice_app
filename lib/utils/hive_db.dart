import 'dart:io';

import 'package:e_vital_rx/utils/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../model/data_model/data_model.dart';
import 'constants.dart';

class HiveDb {
  hiveInit() async {
    Directory? directory = await getApplicationDocumentsDirectory();
    var dbDirectory = Directory("${directory.path}/HiveDb");
    var dbCreatedDirectory = await Directory(dbDirectory.path).create();
    await Hive.initFlutter(dbCreatedDirectory.path);
    Hive.registerAdapter(DataModelAdapter());
    await PrefUtil.init();
  }

  Future<Box> openOrGetBox() async {
    if (Hive.isBoxOpen(eVitalBox)) {
      return Hive.box(eVitalBox);
    } else {
      return await Hive.openBox(eVitalBox);
    }
  }
}
