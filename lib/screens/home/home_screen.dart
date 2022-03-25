import 'package:flutter/material.dart';
import 'package:reminders/models/category/category_collection.dart';
import 'package:reminders/models/todo_list/todo_list.dart';
import 'package:reminders/screens/home/widgets/footer.dart';
import 'package:reminders/screens/home/widgets/list_view_intems.dart';

import 'widgets/grid_view_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String layoutType = 'grid';

  List<TodoList> todoLists = [];

  addNewList(TodoList list) {
    setState(() {
      print('add list');
      todoLists.add(list);
    });
  }

  CategoryCollection categoryCollection = CategoryCollection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              if (layoutType == 'grid') {
                setState(() {
                  layoutType = 'list';
                });
              } else {
                setState(() {
                  layoutType = 'grid';
                });
              }
            },
            child: Text(
              layoutType == 'grid' ? 'Edit' : 'feito',
              // style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  crossFadeState: layoutType == 'grid'
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: GridViewItems(
                    categories: categoryCollection.selectedCategories,
                  ),
                  secondChild:
                      ListViewItems(categoryCollection: categoryCollection)),
            ),
            ListView.builder(
              itemCount: todoLists.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(todoLists[index].title),
                );
              },
            ),
            Footer(addNewListCallback: addNewList)
          ],
        ),
      ),
    );
  }
}
