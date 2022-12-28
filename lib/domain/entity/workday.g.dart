// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workday.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkDayAdapter extends TypeAdapter<WorkDay> {
  @override
  final int typeId = 0;

  @override
  WorkDay read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkDay(
      beginWork: fields[0] as DateTime,
      finishWork: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, WorkDay obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.beginWork)
      ..writeByte(1)
      ..write(obj.finishWork);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkDayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
