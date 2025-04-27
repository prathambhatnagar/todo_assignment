import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todolist_assignment/features/home/widgets/add_task_tile.dart';
import 'package:todolist_assignment/features/home/widgets/todo_tile.dart';
import 'package:todolist_assignment/model/task_model.dart';
import '../../../services/todo_data_base.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Box _data;
  ToDoDataBase dataBase = ToDoDataBase();
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    _data = await Hive.openBox('tasks');

    if (_data.get('todoDate') == null) {
      dataBase.initialData();
    } else {
      dataBase.loadData();
    }
    setState(() {});
  }

  void addTask() {
    setState(() {
      dataBase.tasks.add(TaskModel(task: textController.text));
      dataBase.updateData();
      textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'To Do Assignment',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: dataBase.tasks.length,
        itemBuilder: (context, index) => TodoTile(
          taskModel: dataBase.tasks[index],
          delete: () {
            setState(() {
              dataBase.tasks.removeAt(index);
              dataBase.updateData();
            });
          },
          done: () {
            setState(() {
              dataBase.tasks[index].isDone = !dataBase.tasks[index].isDone;
              dataBase.updateData();
            });
          },
        ),
      ),
      bottomNavigationBar: AddTaskTile(
        textController: textController,
        addTask: addTask,
      ),
    );
  }
}
