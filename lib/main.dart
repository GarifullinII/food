import 'package:flutter/material.dart';
import 'package:food/screens/bottom_tabs_screen.dart';
import 'package:food/screens/category_meals_screen.dart';
import 'package:food/screens/filters_screen.dart';
import 'package:food/screens/meal_detail_screen.dart';
import 'dummy_data.dart';
import 'models/meal.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = dummyMeals;

  void _setFilters(Map<String, bool> filterData) {
    _filters = filterData;
    _availableMeals = dummyMeals.where((meal) {
      if (_filters['gluten']! && !meal.isGlutenFree) {
        return false;
      }
      if (_filters['lactose']! && !meal.isLactoseFree) {
        return false;
      }
      if (_filters['vegan']! && !meal.isVegan) {
        return false;
      }
      if (_filters['vegetarian']! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.blueAccent,
        canvasColor: Colors.grey,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              bodyLarge: const TextStyle(
                color: Colors.white10,
              ),
              bodyMedium: const TextStyle(
                color: Colors.black,
              ),
              bodySmall: const TextStyle(
                color: Colors.grey,
              ),
            ),
      ),
      routes: {
        '/': (context) => const BottomTabsScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(
              availableMeals: _availableMeals,
            ),
        MealDetailScreen.routeName: (context) => const MealDetailScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(
              currentFilters: _filters,
              saveFilters: _setFilters,
            ),
        // '/filters_screen'
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
    );
  }
}
