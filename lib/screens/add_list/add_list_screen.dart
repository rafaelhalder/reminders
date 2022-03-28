import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminders/models/common/custom_color.dart';
import 'package:reminders/models/common/custom_color_collection.dart';
import 'package:reminders/models/common/custom_icon.dart';
import 'package:reminders/models/common/custom_icon_collection.dart';
import 'package:reminders/models/todo_list/todo_list.dart';
import 'package:reminders/models/todo_list/todo_list_collection.dart';

class AddListScreen extends StatefulWidget {
  const AddListScreen({Key? key}) : super(key: key);

  @override
  State<AddListScreen> createState() => _AddListScreenState();
}

class _AddListScreenState extends State<AddListScreen> {
  CustomColor _selectedColor = CustomColorCollection().colors.first;
  CustomIcon _selectedIcon = CustomIconCollection().icons.first;

  final TextEditingController _textController = TextEditingController();

  String _listname = "";

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      setState(() {
        _listname = _textController.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New List'),
          actions: [
            TextButton(
              onPressed: _listname.isEmpty
                  ? null
                  : () {
                      print(_textController.selection);
                      if (_textController.text.isNotEmpty) {

                        Provider.of<TodoListCollection>(
                          context, listen: false).addTodoList(
                            TodoList(
                              id: DateTime.now().toString(),
                              title: _textController.text,
                              icon: {
                                "id": _selectedIcon.id,
                                "color": _selectedColor.id
                              },
                            ));
                        // print('add to database');
                        Navigator.pop(context);
                      } else {
                        print('please include text');
                      }
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: _selectedColor.color),
                child: Icon(_selectedIcon.icon, size: 75),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                    controller: _textController,
                    autofocus: true,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        onPressed: () => _textController.clear(),
                        icon: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).primaryColor),
                            child:
                                const Icon(Icons.clear, color: Colors.white)),
                      ),
                    )),
              ),
              const SizedBox(height: 10),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (final customColor in CustomColorCollection().colors)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedColor = customColor;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          border: _selectedColor.id == customColor.id
                              ? Border.all(color: Colors.grey[600]!, width: 3)
                              : null,
                          color: customColor.color,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (final customIcon in CustomIconCollection().icons)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIcon = customIcon;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          border: _selectedIcon.id == customIcon.id
                              ? Border.all(color: Colors.grey[600]!)
                              : null,
                          color: Theme.of(context).cardColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(customIcon.icon),
                      ),
                    )
                ],
              )
            ],
          ),
        ));
  }
}
