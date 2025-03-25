import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'data_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class DataModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  int phoneNumber;
  @HiveField(3)
  String city;
  @HiveField(4)
  String userProfile;
  @HiveField(5)
  int rupee;

  DataModel({
    this.id = 0,
    this.name = "",
    this.phoneNumber = 0,
    this.city = "",
    this.userProfile = "",
    this.rupee = 0,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}
