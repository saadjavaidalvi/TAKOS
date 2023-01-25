import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:takos/src/models/task_model.dart';

class TaskBoard {
  String id;
  String name;
  List<TaskModel>? tasks;
  TaskBoard({
    this.id = '',
    this.name = '',
    this.tasks,
  });

  TaskBoard copyWith({
    String? id,
    String? name,
    List<TaskModel>? tasks,
  }) {
    return TaskBoard(
      id: id ?? this.id,
      name: name ?? this.name,
      tasks: tasks ?? this.tasks,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'tasks': tasks?.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskBoard.fromMap(Map<String, dynamic> map) {
    return TaskBoard(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      tasks: map['tasks'] != null
          ? List<TaskModel>.from(map['tasks']?.map((x) => TaskModel.fromMap(x)))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskBoard.fromJson(String source) =>
      TaskBoard.fromMap(json.decode(source));

  @override
  String toString() => 'TaskList(id: $id, name: $name, tasks: $tasks)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaskBoard &&
        other.id == id &&
        other.name == name &&
        listEquals(other.tasks, tasks);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ tasks.hashCode;
}
