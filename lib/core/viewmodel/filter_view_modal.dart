import 'package:flutter/material.dart';

class FilterViewModel extends ChangeNotifier {
  // 有无五谷蛋白
  bool _isGlutenFree = false;
  // 有无乳糖
  bool _isLactoseFree = false;
  // 有无素食主义
  bool _isVegetarian = false;
  // 有无严格素食主义
  bool _isVegan = false;

  bool get isGlutenFree {
    return _isGlutenFree;
  }

  set isGlutenFree(bool value) {
    _isGlutenFree = value;
    notifyListeners();
  }

  bool get isLactoseFree {
    return _isLactoseFree;
  }

  set isLactoseFree(bool value) {
    _isLactoseFree = value;
    notifyListeners();
  }

  bool get isVegetarian {
    return _isVegetarian;
  }

  set isVegetarian(bool value) {
    _isVegetarian = value;
    notifyListeners();
  }

  bool get isVegan {
    return _isVegan;
  }

  set isVegan(bool value) {
    _isVegan = value;
    notifyListeners();
  }
}
