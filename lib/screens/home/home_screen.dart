import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reminders/common/widgets/category_icon.dart';
import 'package:reminders/models/category_collection.dart';
import 'package:reminders/screens/home/footer.dart';
import 'package:reminders/screens/home/list_view_intems.dart';

import '../../models/category.dart';
import 'grid_view_items.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String layoutType = 'grid';
  CategoryCollection categoryCollection = CategoryCollection();

  final List<Category> categories = [
    Category(
      id: 'today',
      name: 'Today',
      icon: const CategoryIcon(
        bgColor: CupertinoColors.systemBlue,
        iconData: CupertinoIcons.calendar_today,
      ),
    ),
    Category(
        id: 'scheduled',
        name: 'Scheduled',
        icon: const CategoryIcon(
          bgColor: CupertinoColors.systemRed,
          iconData: CupertinoIcons.calendar,
        )),
    Category(
        id: 'all',
        name: 'All',
        icon: const CategoryIcon(
          bgColor: CupertinoColors.systemGrey,
          iconData: Icons.inbox_rounded,
        )),
    Category(
        id: 'flagged',
        name: 'Flagged',
        icon: const CategoryIcon(
          bgColor: CupertinoColors.systemOrange,
          iconData: CupertinoIcons.flag_fill,
        )),
  ];

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
              style: TextStyle(color: Colors.white),
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
              crossFadeState: layoutType == 'grid' ? 
              CrossFadeState.showFirst : CrossFadeState.showSecond,
              firstChild: GridViewItems(
                 categories: categoryCollection.selectedCategories,
                ),
              secondChild: ListViewItems(categoryCollection: categoryCollection)
             ),
            ),
            const Footer()
          ],
        ),
      ),
    );
  }
}
