// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrencyDataAdapter extends TypeAdapter<CurrencyData> {
  @override
  final int typeId = 1;

  @override
  CurrencyData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrencyData(
      name: fields[0] as String,
      description: fields[1] as String,
      iconUrl: fields[2] as String,
      price: fields[3] as String,
      history: (fields[4] as List).cast<dynamic>(),
      marketCap: fields[5] as int,
      change: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CurrencyData obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.iconUrl)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.history)
      ..writeByte(5)
      ..write(obj.marketCap)
      ..writeByte(6)
      ..write(obj.change);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
