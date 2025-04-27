import 'package:flutter/material.dart';

class AddTaskTile extends StatelessWidget {
  final TextEditingController textController;
  final Function addTask;

  const AddTaskTile({
    super.key,
    required this.textController,
    required this.addTask,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      color: Colors.grey.shade300,
      child: Row(
        children: [
          Flexible(
            flex: 5,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'Add note here...',
                  prefixIcon: Icon(Icons.note_add_outlined),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 60,
              width: 60,
              child: IconButton(
                onPressed: () {
                  if (textController.text != '') {
                    addTask();
                  }
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
