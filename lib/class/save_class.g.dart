// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_class.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SaveSemAdapter extends TypeAdapter<SaveSem> {
  @override
  final int typeId = 0;

  @override
  SaveSem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SaveSem(
      fields[0] as int,
      fields[1] as double,
      fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SaveSem obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.semno)
      ..writeByte(1)
      ..write(obj.sgpa)
      ..writeByte(2)
      ..write(obj.credit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaveSemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
