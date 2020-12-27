import 'package:flutter/material.dart';
import '../data/CategoriesProvider.dart';
import '../models/category.dart';

// ignore: must_be_immutable
class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category-meals";
  Category _category;
  final CategoriesProvider _categoriesProvider;

  CategoryMealsScreen(this._categoriesProvider);

  @override
  Widget build(BuildContext context) {
    setupCategory(ModalRoute.of(context).settings.arguments as Map<String, String>);

    return Scaffold(
      appBar: AppBar(
        title: Text("The Recipes"),
      ),
      body: Center(
        child: Text(_category.title),
      ),
    );
  }

  void setupCategory(Map<String, String> arguments) {
    final categoryId = arguments["id"];
    _category = _categoriesProvider.getCategoryById(categoryId);
  }
}
