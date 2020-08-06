import 'package:flutter/material.dart';
import 'package:flutter_4_to_do_list/models/todo.dart';
import 'package:flutter_4_to_do_list/screens/detailsPage.dart';
import 'package:flutter_4_to_do_list/screens/my_form.dart';

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
        title: Text('To-Do-List!'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MyForm();
                  },
                ),
              );
              setState(() {
                var item = result['item'];
                todoList.add(item);
              });
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: todoList[index].completed == true
                  ? Image.asset('assets/check-icon-2.jpg')
                  : Image.asset('assets/unchecked-icon.png'),
              title: Text(todoList[index].name),
              subtitle: Text(todoList[index].place),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Details(
                        toDoList: todoList[index],
                      );
                    },
                  ),
                );
              },
              onLongPress: () {
                showAlertDialog(context, todoList[index]);
              },
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemCount: todoList.length,
      ),
    );
  }

  showAlertDialog(BuildContext context, Todo todo) {

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Are you sure?"),
      content: todo.completed == true
          ? Text("Are you sure to undo?")
          : Text("Are you sure to mark as completed?"),
      actions: [
        FlatButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          onPressed: () {
            setState(() {
              todo.completed == true
                  ? todo.completed = false
                  : todo.completed = true;
            });
            Navigator.pop(context);
          },
          child: Text('Yes'),
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
