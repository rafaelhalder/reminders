import 'package:flutter/material.dart';
import 'package:reminders/common/widgets/category_icon.dart';

class AddReminderScreen extends StatefulWidget {
  const AddReminderScreen({Key? key}) : super(key: key);

  @override
  State<AddReminderScreen> createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _notesTextController = TextEditingController();

  String _title = "";
  @override
  void initState() {
    super.initState();
    _titleTextController.addListener(() {
      setState(() {
        _title = _titleTextController.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _titleTextController.dispose();
    _notesTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Reminder'),
        actions: [
          TextButton(
            onPressed: _title.isEmpty ? null : () {
              print('add to database');
            },
            child: const Text(
              'Add',
              // style: TextStyle(
              //     color: _listname.isNotEmpty
              //         ? Colors.blueAccent
              //         : Colors.grey)
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).cardColor),
              child: Column(
                children: [
                  TextField(
                    textCapitalization: TextCapitalization.sentences,
                    controller: _titleTextController,
                    decoration: const InputDecoration(
                        hintText: 'Title', border: InputBorder.none),
                  ),
                  const Divider(height: 1),
                  SizedBox(
                    height: 100,
                    child: TextField(
                      textCapitalization: TextCapitalization.sentences,
                      controller: _notesTextController,
                      decoration: const InputDecoration(
                          hintText: 'Notes', border: InputBorder.none),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                color: Theme.of(context).cardColor,
                child: ListTile(
                  leading: Text(
                    'List',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      CategoryIcon(
                        bgColor: Colors.blueAccent,
                        iconData: Icons.calendar_today,
                      ),
                      SizedBox(width: 10),
                      Text('New List'),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                color: Theme.of(context).cardColor,
                child: ListTile(
                  leading: Text(
                    'Category',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      CategoryIcon(
                        bgColor: Colors.blueAccent,
                        iconData: Icons.calendar_today,
                      ),
                      SizedBox(width: 10),
                      Text('Scheduled'),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
