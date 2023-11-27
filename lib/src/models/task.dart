import 'package:json_annotation/json_annotation.dart';
import 'package:todo_app/src/converters/bool_int_converter.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  int? id;
  String description;
  @BoolIntConverter()
  bool completed = false;
  DateTime createdAt;

  Task({
    this.id,
    required this.description,
    required this.completed,
    required this.createdAt,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
