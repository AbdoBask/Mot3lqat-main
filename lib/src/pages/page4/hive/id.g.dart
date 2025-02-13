// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ID.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************


class IdAdapter extends TypeAdapter<Id> {
  @override
  final int typeId = 3;

  @override
  Id read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Id(
      cardNumber: fields[0] as String,
      expiryDate: fields[1] as String,
      cardHolderName: fields[2] as String,
      cvv: fields[3] as String,
      countryFlagEmoji: fields[4] as String,
      cardType: fields[5] == null ? 'other ' : fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Id obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.cardNumber)
      ..writeByte(1)
      ..write(obj.expiryDate)
      ..writeByte(2)
      ..write(obj.cardHolderName)
      ..writeByte(3)
      ..write(obj.cvv)
      ..writeByte(4)
      ..write(obj.countryFlagEmoji)
      ..writeByte(5)
      ..write(obj.cardType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is IdAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}
