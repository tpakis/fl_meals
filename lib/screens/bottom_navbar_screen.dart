import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '../data/CategoriesProvider.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  final List<Map<String, Object>> pages = [
    {
      "page": CategoriesScreen(DummyCategoriesProvider()),
      "title": "Categories",
    },
    {
      "page": FavoritesScreen(),
      "title": "Favorites",
    },
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[_selectedPageIndex]["title"]),
      ),
      drawer: MainDrawer(),
      body: pages[_selectedPageIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        //    type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              //      backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: "Categories"),
          BottomNavigationBarItem(
              //      backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: "Favorites"),
        ],
      ),
    );
  }
}
