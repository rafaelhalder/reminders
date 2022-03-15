import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reminders/common/widgets/category_icon.dart';
import 'package:reminders/models/category/category_collection.dart';
import 'package:reminders/screens/home/widgets/footer.dart';
import 'package:reminders/screens/home/widgets/list_view_intems.dart';

import '../../models/category/category.dart';
import 'widgets/grid_view_items.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String layoutType = 'grid';
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
