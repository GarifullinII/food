import 'package:flutter/material.dart';
import 'package:food/screens/categories_screen.dart';
import 'package:food/screens/favorites_screen.dart';

class BottomTabsScreen extends StatefulWidget {
  const BottomTabsScreen({super.key});

  @override
  State<BottomTabsScreen> createState() => _BottomTabsScreenState();
}

class _BottomTabsScreenState extends State<BottomTabsScreen> {
  final List<Widget> _pages = [
    const CategoriesScreen(),
    const FavoritesScreen(),
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    _selectedPageIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border_outlined),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
