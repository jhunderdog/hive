import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            ElevatedButton(onPressed: () {}, child: Text("Create")),
            ElevatedButton(onPressed: () {}, child: Text("Read")),
            ElevatedButton(onPressed: () {}, child: Text("Update")),
            ElevatedButton(onPressed: () {}, child: Text("Delete")),
          ],
        ),
      ),
    );
  }
}
