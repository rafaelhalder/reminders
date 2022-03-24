import 'package:flutter/material.dart';
import 'package:reminders/models/common/custom_color.dart';
import 'package:reminders/models/common/custom_color_collection.dart';
import 'package:reminders/models/common/custom_icon.dart';
import 'package:reminders/models/common/custom_icon_collection.dart';

class AddListScreen extends StatefulWidget {
  const AddListScreen({Key? key}) : super(key: key);

  @override
  State<AddListScreen> createState() => _AddListScreenState();
}

class _AddListScreenState extends State<AddListScreen> {
  CustomColor _selectedColor = CustomColorCollection().colors.first;
  CustomIcon _selectedIcon = CustomIconCollection().icons.first;

  TextEditingController textController = TextEditingController();

  String listName = "";

  @override
  void initState() {
    super.initState();
    textController.addListener(() {
      setState(() {
        listName = textController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New List'),
          actions: [
            TextButton(
              onPressed: () {
                print(textController.selection);
                if (textController.text.isNotEmpty) {
                  print('add to database');
                } else {
                  print('please include text');
                }
              },
              child: Text('Add', style: TextStyle(
                color: listName.isNotEmpty ? Colors.blueAccent : Colors.grey)),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
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
                    controller: textController,
                    autofocus: true,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor),
                          child: const Icon(Icons.clear)),
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
