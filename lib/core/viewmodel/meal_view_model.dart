// ignore_for_file: unused_field

import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/services/meal_request.dart';
import 'package:favorcate/core/viewmodel/filter_view_modal.dart';
import 'package:flutter/material.dart';

class MealViewModel extends ChangeNotifier {
  List<MealMadel> _meals = [];

  FilterViewModel? _filterVM;

  List<MealMadel> get meals {
    return _meals.where((element) {
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

  void updateFilters(FilterViewModel filterVM) {
    _filterVM = filterVM;
    notifyListeners();
  }

  MealViewModel() {
    MealRequest.getMealData().then((value) {
      _meals = value;
      notifyListeners();
    });
  }
}
