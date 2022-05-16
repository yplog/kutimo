import 'dart:math';

class Rectangle {
  final int id;
  final String note;
  final DateTime date;
  final String color;

  const Rectangle({
    required this.id,
    required this.note,
    required this.color,
    required this.date
  });

  factory Rectangle.fromMap(Map<String, dynamic> json) => Rectangle(
    id: json["id"],
    note: json["note"],
    color: json["color"],
    date: json["date"]
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "note": note,
    "color": color,
    "date": date
  };
}