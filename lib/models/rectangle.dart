import 'package:hive/hive.dart';

part 'rectangle.g.dart';

@HiveType(typeId: 1)
class Rectangle {
  @HiveField(0, defaultValue: 0)
  final int id;

  @HiveField(1)
  final String note;

  @HiveField(2)
  final RecColor color;

  @HiveField(3)
  final DateTime createdDate;
  
  Rectangle(this.id, this.note, this.color, this.createdDate);

  @override
  String toString() {
    return '$id - $color - $createdDate - $note';
  }
}

@HiveType(typeId: 2)
enum RecColor {
  @HiveField(0)
  RED,

  @HiveField(1)
  GREEN,

  @HiveField(2)
  YELLOW,

  @HiveField(3, defaultValue: true)
  BLACK,

  @HiveField(4)
  PURPLE,
}