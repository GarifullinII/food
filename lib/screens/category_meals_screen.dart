import 'package:flutter/material.dart';
import 'package:food/widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  const CategoryMealsScreen({super.key});

  static const routeName = '/category_meals';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;
  late bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title']!;
      final categoryId = routeArgs['id'];
      displayedMeals = dummyMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, item) {
          return MealItem(
            id: displayedMeals[item].id,
            title: displayedMeals[item].title,
            imageUrl: displayedMeals[item].imageUrl,
            duration: displayedMeals[item].duration,
            complexity: displayedMeals[item].complexity,
            affordability: displayedMeals[item].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
