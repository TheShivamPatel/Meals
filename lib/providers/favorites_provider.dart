import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meals.dart';

class FavoriteMealsNotifiers extends StateNotifier<List<Meal>>{
  FavoriteMealsNotifiers() : super([]);

  bool toggleMealsFavoriteStatus(Meal meal){
    final mealsIsFavorite = state.contains(meal);

    if(mealsIsFavorite){
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }
    else{
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifiers, List<Meal>>((ref){
  return FavoriteMealsNotifiers();
});