import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_database/todo.dart';

class AddTodo extends StatelessWidget {
  TextEditingController titleContoller = TextEditingController();
  Box todoBox = Hive.box<Todo>('todo');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: titleContoller,
              decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (titleContoller.text != '') {
                    Todo newTodo = Todo(
                      title: titleContoller.text,
                      isCompleted: false,
                    );
                    todoBox.add(newTodo);
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "Add Todo",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
