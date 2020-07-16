import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  Details({this.toDoList});
  final toDoList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(toDoList.name),
            Text(toDoList.place),
            Text(toDoList.description),
          ],
        ),
      ),
    );
  }
}
