import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist_assignment/model/task_model.dart';

class TodoTile extends StatefulWidget {
  final TaskModel taskModel;
  final Function delete;
  final Function done;

  const TodoTile({
    super.key,
    required this.taskModel,
    required this.delete,
    required this.done,
  });

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade300,
        ),
        padding: const EdgeInsets.all(2),
        child: ListTile(
          leading: Checkbox(
            activeColor: Colors.blue,
            value: widget.taskModel.isDone,
            onChanged: (value) {
              widget.done();
              setState(() {});
            },
          ),
          title: Text(
            widget.taskModel.task,
            style: TextStyle(
              fontSize: 16,
              decoration: widget.taskModel.isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          subtitle: Text(
            DateFormat('dd MMM  hh:mm').format(widget.taskModel.time),
          ),
          trailing: IconButton(
            onPressed: () {
              widget.delete();
            },
            icon: Icon(
              Icons.delete_rounded,
              color: Colors.red.shade800,
            ),
          ),
        ),
      ),
    );
  }
}
