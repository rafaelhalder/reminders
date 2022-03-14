import 'package:flutter/cupertino.dart';
import 'package:reminders/models/category.dart';
import '../../models/category_collection.dart';

class GridViewItems extends StatelessWidget {
  const GridViewItems({
    required this.categories,
  });

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
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
                        children: [category.icon, const Text('0')],
                      ),
                      Text(category.name)
                    ],
                  ),
                )),
          )
          .toList(),
    );
  }
}
