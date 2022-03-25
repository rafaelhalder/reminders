import 'package:flutter/material.dart';
import 'package:reminders/models/todo_list/todo_list.dart';
import 'package:reminders/screens/add_list/add_list_screen.dart';
import 'package:reminders/screens/add_reminder/add_reminder_screen.dart';

class Footer extends StatelessWidget {
  final addNewListCallback;

  const Footer({
    required this.addNewListCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddReminderScreen(),
                      fullscreenDialog: true));
            },
            icon: const Icon(Icons.add_circle),
            label: const Text('Add Reminder'),
          ),
          TextButton(
            onPressed: () async {
              TodoList newList = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddListScreen(),
                      fullscreenDialog: true));
              addNewListCallback(newList);

              //Navigator.pushNamed(context, '/addList');
            },
            child: const Text('Add List'),
          )
        ],
      ),
    );
  }
}
