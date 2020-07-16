import 'package:flutter/material.dart';
import 'package:flutter_4_to_do_list/screens/todolist.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'to-do-list',
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: TodoList()
    );
  }
}
