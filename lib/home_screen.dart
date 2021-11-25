import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Box friendBox = Hive.box('friend');
  String? name;

  addFriend() async {
    await friendBox.put('name', "Bill Gates");
  }

  getfriend() async {
    setState(() {
      name = friendBox.get('name');
    });
  }

  updateFriend() async {
    await friendBox.put('name', "Elon Musk");
  }

  deleteFriend() async {
    await friendBox.delete('name');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive DB"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$name"),
            ElevatedButton(onPressed: addFriend, child: Text("Create")),
            ElevatedButton(onPressed: getfriend, child: Text("Read")),
            ElevatedButton(onPressed: updateFriend, child: Text("Update")),
            ElevatedButton(onPressed: deleteFriend, child: Text("Delete")),
          ],
        ),
      ),
    );
  }
}
