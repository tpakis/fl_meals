import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    Key key,
    @required Meal meal,
  })  : _meal = meal,
        super(key: key);

  final Meal _meal;

  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  //BoxFit.cover = resize and crop to fit ,  double.infinity = match_parent
                  child: Image.network(_meal.imageUrl, height: 250, width: double.infinity, fit: BoxFit.cover,),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
