import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/providers/favorites_provider.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          actions: [
            IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealsFavoriteStatus(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(wasAdded ? 'Meal added as a favorite.' : 'Meal remove from favorite.'),
                  ),
                );
              },
              icon: Icon(isFavorite ? Icons.star : Icons.star_border),
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
