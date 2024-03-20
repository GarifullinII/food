import 'package:flutter/material.dart';
import 'package:food/models/meal.dart';
import 'package:food/screens/meal_detail_screen.dart';
import 'additional_info.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    super.key,
  });

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    );
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.luxurious:
        return 'Luxurious';
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInfo(
                  additionalInfo: '$duration min',
                  icon: const Icon(Icons.schedule),
                ),
                AdditionalInfo(
                  additionalInfo: complexityText,
                  icon: const Icon(Icons.work_history_outlined),
                ),
                AdditionalInfo(
                  additionalInfo: affordabilityText,
                  icon: const Icon(Icons.attach_money),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
