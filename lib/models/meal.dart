import 'package:flutter/foundation.dart';

class Meal {
  final String id;
  final List<String> belongingCategories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final MealComplexity complexity;
  final MealAffordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
      @required this.id,
      @required this.belongingCategories,
      @required this.title,
      @required this.imageUrl,
      @required this.ingredients,
      @required this.steps,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.isVegetarian});
}

enum MealAffordability {
  Affordable,
  Pricey,
  Luxurious
}
enum MealComplexity {
  Simple,
  Challenging,
  Hard
}