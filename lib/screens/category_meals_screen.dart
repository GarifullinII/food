import 'package:flutter/material.dart';
import 'package:food/widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({super.key});

  static const routeName = '/category_meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = dummyMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle ?? 'No category'),
      ),
      body: ListView.builder(
        itemBuilder: (context, item) {
          return MealItem(
            title: categoryMeals[item].title,
            imageUrl: categoryMeals[item].imageUrl,
            duration: categoryMeals[item].duration,
            complexity: categoryMeals[item].complexity,
            affordability: categoryMeals[item].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
