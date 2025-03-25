// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataModelAdapter extends TypeAdapter<DataModel> {
  @override
  final int typeId = 1;

  @override
  DataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataModel(
      id: fields[0] as int,
      name: fields[1] as String,
      phoneNumber: fields[2] as int,
      city: fields[3] as String,
      userProfile: fields[4] as String,
      rupee: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DataModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.city)
      ..writeByte(4)
      ..write(obj.userProfile)
      ..writeByte(5)
      ..write(obj.rupee);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? "",
      phoneNumber: (json['phoneNumber'] as num?)?.toInt() ?? 0,
      city: json['city'] as String? ?? "",
      userProfile: json['userProfile'] as String? ?? "",
      rupee: (json['rupee'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'city': instance.city,
      'userProfile': instance.userProfile,
      'rupee': instance.rupee,
    };
