import 'package:flutter/material.dart';
import '../data/MealsProvider.dart';
import '../data/CategoriesProvider.dart';
import '../models/category.dart';

// ignore: must_be_immutable
class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category-meals";
  Category _category;
  final CategoriesProvider _categoriesProvider;
  final MealsProvider _mealsProvider;

  CategoryMealsScreen(this._categoriesProvider, this._mealsProvider);

  @override
  Widget build(BuildContext context) {
    setupCategory(ModalRoute.of(context).settings.arguments as Map<String, String>);

    return Scaffold(
      appBar: AppBar(
        title: Text("The Recipes"),
      ),
      body: ListView.builder(itemBuilder: (ctx, index) {
        return
      },
      itemCount: ,),
    );
  }

  void setupCategory(Map<String, String> arguments) {
    final categoryId = arguments["id"];
    _category = _categoriesProvider.getCategoryById(categoryId);
  }
}
