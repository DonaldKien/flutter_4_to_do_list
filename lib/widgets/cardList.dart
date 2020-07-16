import 'package:flutter/material.dart';
import 'longPressDialogAlert.dart';
import 'package:flutter_4_to_do_list/screens/detailsPage.dart';

class CardList extends StatelessWidget {
  CardList({this.toDoListIndex});
  final toDoListIndex;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: toDoListIndex.completed == true
            ? Image.asset('assets/check-icon-2.jpg')
            : Image.asset('assets/unchecked-icon.png'),
        title: Text(toDoListIndex.name),
        subtitle: Text(toDoListIndex.place),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Details(
                  toDoList: toDoListIndex,
                );
              },
            ),
          );
        },
        onLongPress: () {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return LongPressDialogAlert(
                context: context,
                toDoListIndex: toDoListIndex,
              );
            },
          );
        },
      ),
    );
  }
}



