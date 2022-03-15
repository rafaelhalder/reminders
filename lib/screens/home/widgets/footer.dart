import 'package:flutter/material.dart';
import 'package:reminders/screens/home/add_list/add_list_screen.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add_circle),
            label: const Text('Add Reminder'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddListScreen(),
                      fullscreenDialog: true));

              //Navigator.pushNamed(context, '/addList');
            },
            child: const Text('Add List'),
          )
        ],
      ),
    );
  }
}
