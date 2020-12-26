import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/category.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  String _title;
  Color _color;
  Category _category;

  CategoryItem(Category category) {
    _category = category;
    _title = category.title;
    _color = category.color;
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(15);

    return InkWell(
      onTap: () {
        selectCategory(context, _category);
      },
      borderRadius: borderRadius,
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          _title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [_color.withOpacity(0.7), _color],
            ),
            borderRadius: borderRadius),
      ),
    );
  }

  void selectCategory(BuildContext context, Category category) {
    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName,
        arguments: {"id": category.id});
  }
}
