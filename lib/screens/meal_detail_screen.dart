import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../data/MealsProvider.dart';

// ignore: must_be_immutable
class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";
  final MealsProvider _mealsProvider;
  Meal _meal;

  MealDetailScreen(this._mealsProvider);

  @override
  Widget build(BuildContext context) {
    setupMeal(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_meal.title),
      ),
      body: Center(
        child: Text(_meal.title),
      ),
    );
  }

  void setupMeal(BuildContext context) {
    String id = ModalRoute.of(context).settings.arguments as String;
    _meal = _mealsProvider.getMealById(id);
  }
}
