import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:faker/faker.dart';
import 'package:hive/hive.dart';

import '../../model/data_model/data_model.dart';
import '../../utils/constants.dart';
import '../../utils/hive_db.dart';

part 'store_data_state.dart';

class StoreDataCubit extends Cubit<StoreDataState> {
  StoreDataCubit() : super(StoreDataInitial());

  Box? box;

  storeDateInit() async {
    Faker faker = Faker();
    Random random = Random();
    box = await HiveDb().openOrGetBox();
    List<DataModel> storeDataModelList = List.generate(43, (index) {
      return DataModel(
        id: index,
        name: faker.person.firstName(),
        phoneNumber: generateNumber(),
        city: faker.address.city(),
        rupee: random.nextInt(100),
        userProfile: "https://picsum.photos/200/300?random=$index",
      );
    });
    box!.put(hiveData, storeDataModelList);
  }

  int generateNumber() {
    Random random = Random();
    String generatedNumber =
        "9${random.nextInt(1000000000).toString().padLeft(9, '0')}";
    int number = int.parse(generatedNumber);
    return number;
  }
}
