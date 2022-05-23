// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rectangle.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RectangleAdapter extends TypeAdapter<Rectangle> {
  @override
  final int typeId = 1;

  @override
  Rectangle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Rectangle(
      fields[0] == null ? 0 : fields[0] as int,
      fields[1] as String,
      fields[2] as RecColor,
      fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Rectangle obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.note)
      ..writeByte(2)
      ..write(obj.color)
      ..writeByte(3)
      ..write(obj.createdDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RectangleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RecColorAdapter extends TypeAdapter<RecColor> {
  @override
  final int typeId = 2;

  @override
  RecColor read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return RecColor.red;
      case 1:
        return RecColor.green;
      case 2:
        return RecColor.yellow;
      case 3:
        return RecColor.black;
      case 4:
        return RecColor.purple;
      case 5:
        return RecColor.blue;
      case 6:
        return RecColor.white;
      default:
        return RecColor.black;
    }
  }

  @override
  void write(BinaryWriter writer, RecColor obj) {
    switch (obj) {
      case RecColor.red:
        writer.writeByte(0);
        break;
      case RecColor.green:
        writer.writeByte(1);
        break;
      case RecColor.yellow:
        writer.writeByte(2);
        break;
      case RecColor.black:
        writer.writeByte(3);
        break;
      case RecColor.purple:
        writer.writeByte(4);
        break;
      case RecColor.blue:
        writer.writeByte(5);
        break;
      case RecColor.white:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecColorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
