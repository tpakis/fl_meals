import 'package:flutter/material.dart';
import '../utils/dummy_data.dart';
import '../models/category.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Category> categories = DUMMY_CATEGORIES;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DeliMeal")),
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children:
            categories.map((category) => categoryToWidget(category)).toList(),
      ),
    );
  }

  CategoryItem categoryToWidget(Category category) {
    return CategoryItem(category.title, category.color);
  }
}
