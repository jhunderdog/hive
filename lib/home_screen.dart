import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_database/add_todo.dart';
import 'package:hive_database/todo.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Box todoBox = Hive.box<Todo>('todo');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hive Todo"),
        ),
        body: ValueListenableBuilder(
            valueListenable: todoBox.listenable(),
            builder: (context, Box box, widget) {
              if (box.isEmpty) {
                return Center(
                  child: Text("No Todo available !"),
                );
              } else {
                return ListView.builder(
                    reverse: true,
                    shrinkWrap: true,
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      Todo todo = box.getAt(index);
                      return ListTile(
                        title: Text(
                          todo.title,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: todo.isCompleted
                                  ? Colors.green
                                  : Colors.black,
                              decoration: todo.isCompleted
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none),
                        ),
                        leading: Checkbox(
                          value: todo.isCompleted,
                          onChanged: (value) {
                            Todo newTodo =
                                Todo(title: todo.title, isCompleted: value!);
                            box.putAt(index, newTodo);
                          },
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            box.deleteAt(index);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Todo Deleted Successfully!"),
                            ));
                          },
                        ),
                      );
                    });
              }
            }),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTodo(),
              ),
            );
          },
        ));
  }
}
