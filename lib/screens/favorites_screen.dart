import 'package:flutter/material.dart';
import 'package:food/models/meal.dart';

import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen({
    required this.favoriteMeals,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text(
          'You have no favorite yet - start adding some!',
        ),);
    }
    else {
      return ListView.builder(
        itemBuilder: (context, item) {
          return MealItem(
            id: favoriteMeals[item].id,
            title: favoriteMeals[item].title,
            imageUrl: favoriteMeals[item].imageUrl,
            duration: favoriteMeals[item].duration,
            complexity: favoriteMeals[item].complexity,
            affordability: favoriteMeals[item].affordability,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
