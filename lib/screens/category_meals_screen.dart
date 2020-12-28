import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';
import '../data/MealsProvider.dart';
import '../data/CategoriesProvider.dart';
import '../models/category.dart';

// ignore: must_be_immutable
class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category-meals";

  final CategoriesProvider _categoriesProvider;
  final MealsProvider _mealsProvider;

  Category _category;
  List<Meal> _mealsInCategory;

  CategoryMealsScreen(this._categoriesProvider, this._mealsProvider);

  @override
  Widget build(BuildContext context) {
    setupCategory(
        ModalRoute.of(context).settings.arguments as Map<String, String>);
    setupMeals();
    return Scaffold(
      appBar: AppBar(
        title: Text("The Recipes"),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          Meal mealToShow = _mealsInCategory[index];
          return MealItem(
            key: Key(mealToShow.id),
            meal: mealToShow,
          );
        },
        itemCount: _mealsInCategory.length,
      ),
    );
  }

  void setupMeals() {
    _mealsInCategory = _mealsProvider.getAllMealsByCategoryId(_category.id);
  }

  void setupCategory(Map<String, String> arguments) {
    final categoryId = arguments["id"];
    _category = _categoriesProvider.getCategoryById(categoryId);
  }
}
