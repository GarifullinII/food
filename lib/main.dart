import 'package:flutter/material.dart';

import 'categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const CategoriesScreen(),
    );
  }
}
