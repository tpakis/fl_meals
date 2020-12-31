import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/bottom_navbar_screen.dart';
import './data/CategoriesProvider.dart';
import './data/MealsProvider.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "RobotoCondensed"),
            ),
      ),
      home: BottomNavBarScreen(),
      // initialRoute: "/" // default is "/",
      // map with curly
      routes: {
        //set initial screen "/": (context) => CategoriesScreen()
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(
              DummyCategoriesProvider(),
              DummyMealsProvider(),
            ),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(DummyMealsProvider()),
      },
      // this is used when we try to navigate to route (pushNamed) but this is not registered in routes.
      // we can exploit this for dynamic screen, or deep links since we get access to the settings which
      // contain the name and the arguments
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(
            builder: (ctx) => CategoriesScreen(DummyCategoriesProvider()));
      },
      // fallback if we couldn't use routes or onGenerateRoute
      onUnknownRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(
            builder: (ctx) => CategoriesScreen(DummyCategoriesProvider()));
      },
    );
  }
}
