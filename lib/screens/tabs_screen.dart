import 'package:flutter/material.dart';
import '../data/CategoriesProvider.dart';
import '../screens/favorites_screen.dart';
import '../screens/categories_screen.dart';

class TabsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Meals"),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: "Categories",
              ),
              Tab(
                icon: Icon(Icons.star),
                text: "Favorites",
              )
            ],
          ),
        ),
      body: TabBarView(children: [
        CategoriesScreen(DummyCategoriesProvider()),
        FavoritesScreen(),
      ],),),
    );
  }
}
