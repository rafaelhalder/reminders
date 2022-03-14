import 'package:flutter/material.dart';
import 'package:reminders/models/category_collection.dart';

const LIST_VIEW_HEIGHT = 70.0;

class ListViewItems extends StatefulWidget {
  final CategoryCollection categoryCollection;

  const ListViewItems({required this.categoryCollection});

  @override
  State<ListViewItems> createState() => _ListViewItemsState();
}

class _ListViewItemsState extends State<ListViewItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      height: widget.categoryCollection.categories.length*LIST_VIEW_HEIGHT,
      child: ReorderableListView(
          onReorder: (int oldIndex, int newIndex) {
            print('old $oldIndex');
            print('new $newIndex');

            if (newIndex > oldIndex) {
              newIndex -= 1;
            }

            final item = widget.categoryCollection.removeItem(oldIndex);
            setState(() {
              widget.categoryCollection.insert(newIndex, item);
            });
          },
          children: widget.categoryCollection.categories
              .map(
                (category) => SizedBox(
                    key: UniqueKey(),
                  height: LIST_VIEW_HEIGHT,
                  child: ListTile(
                      onTap: () {
                        setState(() {
                          category.toggledIsChecked();
                        });
                      },
                      leading: Container(
                        decoration: BoxDecoration(
                            color: category.isChecked ? 
                            Colors.blueAccent:
                            Colors.transparent, shape: BoxShape.circle,
                        border: Border.all(
                          color: category.isChecked ?
                          Colors.blueAccent :
                          Colors.grey
                        ),
                        ),
                        child: Icon(Icons.check,color: category.isChecked ?
                        Colors.white :
                        Colors.transparent,
                        ),
                        
                      ),
                      title: Row(
                        children: [
                          category.icon,
                          SizedBox(
                            width: 10,
                          ),
                          Text(category.name),
                        ],
                      ),
                      trailing: Icon(Icons.reorder)),
                ),
              )
              .toList()),
    );
  }
}
