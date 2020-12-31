import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../data/MealsProvider.dart';

// ignore: must_be_immutable
class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";
  final MealsProvider _mealsProvider;
  Meal _meal;

  MealDetailScreen(this._mealsProvider);

  // should be moved to a new widget instead of build method
  // when Theme changes it will trigger a build of the whole screen. If it was
  // on its own widget it would trigger a build of only that widget
  Widget _buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: Theme.of(context).textTheme.headline6),
    );
  }

  Widget _buildIngredientsView(BuildContext context, List<String> ingredients) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: ListView.builder(
        itemCount: ingredients.length,
        itemBuilder: (ctx, index) {
          return Card(
            color: Theme.of(context).accentColor,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(ingredients[index])),
          );
        },
      ),
    );
  }

  Widget _buildStepsView(BuildContext context, List<String> steps) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: ListView.builder(
        itemCount: steps.length,
        itemBuilder: (ctx, index) {
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: Text("# ${index + 1}"),
                ),
                title: Text(steps[index]),
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    setupMeal(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(_meal.imageUrl, fit: BoxFit.cover),
            ),
            _buildSectionTitle(context, "Ingredients"),
            _buildIngredientsView(context, _meal.ingredients),
            _buildSectionTitle(context, "Steps"),
            _buildStepsView(context, _meal.steps),
          ],
        ),
      ),
    );
  }

  void setupMeal(BuildContext context) {
    String id = ModalRoute.of(context).settings.arguments as String;
    _meal = _mealsProvider.getMealById(id);
  }
}
