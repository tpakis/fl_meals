import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/meal_detail_screen.dart';
import '../widgets/icon_text.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem(
      {Key key, @required Meal meal, @required Function onMealRemoved})
      : _meal = meal,
        _onMealRemoved = onMealRemoved,
        super(key: key);

  final Meal _meal;
  final Function(String) _onMealRemoved;

  void selectMeal(BuildContext context, String selectedMealId) {
    // The navigation methods return a future which will be completed when the page is closed!
    // Not when we navigate to that but when we come back or close it. It can also return an object
    // as an argument of the pop method (remove) and we get this in the value of the future or null.
    Navigator.of(context)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: selectedMealId,
    ).then((value) {
      if (value != null && value is String) {
        _onMealRemoved(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectMeal(context, _meal.id);
      },
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
                  child: Image.network(
                    _meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      _meal.title,
                      overflow: TextOverflow.fade,
                      softWrap: true,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconText(
                    iconData: Icons.schedule,
                    text: "${_meal.duration} min",
                  ),
                  IconText(
                    iconData: Icons.work,
                    text: "${_meal.complexity.name}",
                  ),
                  IconText(
                    iconData: Icons.money,
                    text: "${_meal.affordability.name}",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
