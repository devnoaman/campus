import 'task.dart';

class TasksProvider {
  int? length;
  List<Task>? tasks;

  TasksProvider({this.length, this.tasks});

  factory TasksProvider.fromJson(Map<String, dynamic> json) => TasksProvider(
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
