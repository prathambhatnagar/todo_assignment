import 'package:hive/hive.dart';
import '../model/task_model.dart';

class ToDoDataBase {
  List<TaskModel> tasks = [];
  final Box _data = Hive.box('tasks');

  void initialData() {
    tasks = [
      TaskModel(task: 'This Is a Assignment Application'),
      TaskModel(task: 'Assignment completed'),
    ];
    updateData();
  }

  void loadData() {
    List<dynamic> storedData = _data.get('todoDate', defaultValue: []);
    tasks = storedData
        .map((task) => TaskModel(
            task: task['task'],
            isDone: task['isDone'],
            time: DateTime.parse(task['time'])))
        .toList();
  }

  void updateData() {
    List<Map<String, dynamic>> taskList = tasks
        .map((task) => {
              'task': task.task,
              'isDone': task.isDone,
              'time': task.time.toIso8601String(),
            })
        .toList();

    _data.put('todoDate', taskList);
  }
}
