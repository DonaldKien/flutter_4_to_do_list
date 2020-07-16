import 'package:flutter/material.dart';
import 'package:flutter_4_to_do_list/screens/my_form.dart';

class ActionIconButton extends StatefulWidget {
  ActionIconButton({this.context, this.todoList});
  final context;
  final todoList;
  @override
  _ActionIconButtonState createState() => _ActionIconButtonState();
}

class _ActionIconButtonState extends State<ActionIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
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
          widget.todoList.add(item);
        });
      },
    );
  }
}