import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';
import '../data/MealsProvider.dart';
import '../data/CategoriesProvider.dart';
import '../models/category.dart';

// ignore: must_be_immutable
class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";

  final CategoriesProvider _categoriesProvider;
  final MealsProvider _mealsProvider;


  CategoryMealsScreen(this._categoriesProvider, this._mealsProvider);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  Category _category;

  List<Meal> _mealsInCategory;

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
            onMealRemoved: onMealRemoved,
          );
        },
        itemCount: _mealsInCategory.length,
      ),
    );
  }

  void setupMeals() {
    _mealsInCategory = widget._mealsProvider.getAllMealsByCategoryId(_category.id);
  }

  void setupCategory(Map<String, String> arguments) {
    final categoryId = arguments["id"];
    _category = widget._categoriesProvider.getCategoryById(categoryId);
  }

  void onMealRemoved(String mealId) {
    widget._mealsProvider.removeMealById(mealId);
    setState(() {
      // just to refresh the view state, the changes are handled by the meals provider
      print("meal with id $mealId was removed!");
    });
  }
}
