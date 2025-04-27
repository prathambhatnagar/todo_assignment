import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  String task;

  @HiveField(1)
  bool isDone;

  @HiveField(2)
  DateTime time;

  TaskModel({
    this.isDone = false,
    required this.task,
    DateTime? time,
  }) : time = time ?? DateTime.now();
}
