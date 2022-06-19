import 'package:favorcate/core/model/meal_model.dart';
import 'package:flutter/material.dart';

import 'filter_view_modal.dart';

class FavorViewModel extends ChangeNotifier {
  List<MealMadel> _favorMeals = [];

  FilterViewModel? _filterVM;

  List<MealMadel> get favorMeals {
    return _favorMeals.where((element) {
      if (_filterVM != null &&
          _filterVM!.isGlutenFree &&
          !element.isGlutenFree) {
        return false;
      }

      if (_filterVM != null &&
          _filterVM!.isLactoseFree &&
          !element.isLactoseFree) {
        return false;
      }

      if (_filterVM != null && _filterVM!.isVegan && !element.isVegan) {
        return false;
      }

      if (_filterVM != null &&
          _filterVM!.isVegetarian &&
          !element.isVegetarian) {
        return false;
      }

      return true;
    }).toList();
  }

  void addMeal(MealMadel meal) {
    _favorMeals.add(meal);
    notifyListeners();
  }

  void removeMeal(MealMadel meal) {
    _favorMeals =
        _favorMeals.where((element) => element.id != meal.id).toList();
    notifyListeners();
  }

  bool isFavor(MealMadel meal) {
    return _favorMeals.contains(meal);
  }

  void handleMeal(MealMadel meal) {
    if (isFavor(meal)) {
      removeMeal(meal);
    } else {
      addMeal(meal);
    }
  }

  void updateFilters(FilterViewModel filterVM) {
    _filterVM = filterVM;
    notifyListeners();
  }
}
