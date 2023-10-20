import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen(
      {super.key, required this.meal, required this.onToggleFavorite});

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          actions: [
            IconButton(
              onPressed: () {
                onToggleFavorite(meal);
              },
              icon: Icon(Icons.star_border),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                meal.imageUrl,
                height: 270,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Ingredients',
                style: TextStyle(color: Colors.orangeAccent, fontSize: 24),
              ),
              for (final ingredient in meal.ingredients)
                Text(
                  ingredient,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Steps',
                style: TextStyle(color: Colors.orangeAccent, fontSize: 24),
              ),
              for (final step in meal.steps)
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text(
                    step,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ));
  }
}
