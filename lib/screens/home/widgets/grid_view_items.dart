
import 'package:flutter/material.dart';
import 'package:reminders/models/category/category.dart';

class GridViewItems extends StatelessWidget {
  const GridViewItems({
    required this.categories,
  });

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        padding: const EdgeInsets.all(10),
        childAspectRatio: 16 / 9,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: categories
            .map(
              (category) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF1A191D),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [category.icon, Text('0',
                           style: Theme.of(context).textTheme.headline6)],
                        ),
                        Text(category.name,
                         style: Theme.of(context).textTheme.headline6)
                      ],
                    ),
                  )),
            )
            .toList(),
      ),
    );
  }
}
