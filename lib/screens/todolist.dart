import 'package:flutter/material.dart';
import 'package:flutter_4_to_do_list/models/todo.dart';
import 'package:flutter_4_to_do_list/widgets/actionIconButton.dart';
import 'package:flutter_4_to_do_list/widgets/cardList.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> todoList = [
    Todo(
        name: "Revise last week exercise",
        place: "At your home",
        description: "Button, ListView",
        completed: true),
    Todo(
        name: "Buy burger",
        place: "Dengkil",
        description: "Oblong special",
        completed: false),
    Todo(
        name: "Pay salary",
        place: "Office",
        description: "before 25th of the month",
        completed: false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do-List'),
        actions: <Widget>[
          ActionIconButton(
            context: context,
            todoList: todoList,
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return CardList(
            toDoListIndex: todoList[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemCount: todoList.length,
      ),
    );
  }
}






