import 'package:flutter/material.dart';

class LongPressDialogAlert extends StatefulWidget {
  LongPressDialogAlert({this.context, this.toDoListIndex});
  final context;
  final toDoListIndex;
  @override
  _LongPressDialogAlertState createState() => _LongPressDialogAlertState();
}

class _LongPressDialogAlertState extends State<LongPressDialogAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Are you sure?'),
      content: widget.toDoListIndex.completed
          ? Text("Are you sure to undo?")
          : Text("Are you sure to mark as completed?"),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            setState(() {
              widget.toDoListIndex.completed == true
                  ? widget.toDoListIndex.completed = false
                  : widget.toDoListIndex.completed = true;
            });
            Navigator.pop(context);
          },
          child: Text('Yes'),
        ),
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('No'),
        ),
      ],
    );
  }
}