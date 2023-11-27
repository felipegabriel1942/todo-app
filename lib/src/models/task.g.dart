// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: json['id'] as int?,
      description: json['description'] as String,
      completed: const BoolIntConverter().fromJson(json['completed'] as int),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'completed': const BoolIntConverter().toJson(instance.completed),
      'createdAt': instance.createdAt.toIso8601String(),
    };
