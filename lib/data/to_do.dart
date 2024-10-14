import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'to_do.freezed.dart';
part 'to_do.g.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    required String title,
    required String subtitle,
    required bool isDone,
  }) = _Todo;

  factory Todo.fromJson(Map<String, Object?> json) => _$TodoFromJson(json);
}
