// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RateModelAdapter extends TypeAdapter<RateModel> {
  @override
  final int typeId = 0;

  @override
  RateModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RateModel(
      fields[0] as String,
      fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, RateModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.currencyName)
      ..writeByte(1)
      ..write(obj.currencyRate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RateModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
