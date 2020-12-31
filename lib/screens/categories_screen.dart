import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/data/CategoriesProvider.dart';
import '../models/category.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {

  final List<Category> categories;
  final CategoriesProvider _categoriesProvider;

  CategoriesScreen(this._categoriesProvider) :
    categories = _categoriesProvider.getAllCategories();


  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children:
            categories.map((category) => categoryToWidget(category)).toList(),
      );
  }

  CategoryItem categoryToWidget(Category category) {
    return CategoryItem(category);
  }
}
