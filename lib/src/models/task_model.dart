import 'dart:convert';

import 'package:flutter/foundation.dart';

class TaskModel {
  String id;
  String title;
  String description;
  String dateTime;
  String driveLink;
  String label;
  List<TaskModel>? subTasks;
  TaskModel({
    this.id = '',
    this.title = '',
    this.description = '',
    this.dateTime = '',
    this.driveLink = '',
    this.label = '',
    this.subTasks,
  });

  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
    String? dateTime,
    String? driveLink,
    String? label,
    List<TaskModel>? subTasks,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dateTime: dateTime ?? this.dateTime,
      driveLink: driveLink ?? this.driveLink,
      label: label ?? this.label,
      subTasks: subTasks ?? this.subTasks,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTime': dateTime,
      'driveLink': driveLink,
      'label': label,
      'subTasks': subTasks?.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      dateTime: map['dateTime'] ?? '',
      driveLink: map['driveLink'] ?? '',
      label: map['label'] ?? '',
      subTasks: map['subTasks'] != null
          ? List<TaskModel>.from(
              map['subTasks']?.map(
                (x) => TaskModel.fromMap(x),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, description: $description, dateTime: $dateTime, driveLink: $driveLink, label: $label, subTasks: $subTasks)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaskModel &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.dateTime == dateTime &&
        other.driveLink == driveLink &&
        other.label == label &&
        listEquals(other.subTasks, subTasks);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        dateTime.hashCode ^
        driveLink.hashCode ^
        label.hashCode ^
        subTasks.hashCode;
  }
}
