import 'task.dart';

class TaskModel {
  int? length;
  List<Task>? tasks;

  TaskModel({this.length, this.tasks});

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        length: json['length'] as int?,
        tasks: (json['Tasks'] as List<dynamic>?)
            ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'length': length,
        'Tasks': tasks?.map((e) => e.toJson()).toList(),
      };
}
