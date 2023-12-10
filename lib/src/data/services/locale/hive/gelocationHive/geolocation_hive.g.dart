// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geolocation_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GeolocationHiveAdapter extends TypeAdapter<GeolocationHive> {
  @override
  final int typeId = 1;

  @override
  GeolocationHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GeolocationHive(
      lat: fields[0] as double,
      lon: fields[1] as double,
      townName: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GeolocationHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.lon)
      ..writeByte(2)
      ..write(obj.townName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeolocationHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
