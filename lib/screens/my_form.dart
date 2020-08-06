import 'package:flutter/material.dart';
import 'package:flutter_4_to_do_list/models/todo.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  var nameController = TextEditingController();
  var descController = TextEditingController();
  var placeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add List'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 5,
        ),
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Flexible(
                  child: Text(
                    'Add New Item',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Item Name'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: descController,
                  decoration: InputDecoration(
                    labelText: 'Enter Item Description',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: placeController,
                  decoration: InputDecoration(
                    labelText: 'Enter Item Place',
                    border: OutlineInputBorder(),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    var newItem = Todo(
                      name: nameController.text,
                      place: placeController.text,
                      description: descController.text,
                    );
                    Navigator.pop(context,{'item': newItem});
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
