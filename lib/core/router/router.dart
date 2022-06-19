import 'package:favorcate/ui/views/filter/fliter.dart';
import 'package:favorcate/ui/views/main/main.dart';
import 'package:favorcate/ui/views/meal/meal.dart';
import 'package:favorcate/ui/views/meal_detail/meal_detail.dart';
import 'package:flutter/material.dart';

class Routers {
  static const String initialRoute = MainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    MainScreen.routeName: (context) => const MainScreen(),
    MealScreen.routeName: (context) => const MealScreen(),
    MealDetailScreen.routeName: (context) => const MealDetailScreen(),
  };

  static MaterialPageRoute? generatorRoute(settings) {
    if (settings.name == FilterScreen.routeName) {
      return MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return const FilterScreen();
        },
      );
    }

    return null;
  }

  static MaterialPageRoute unknowRoute(settings) {
    return MaterialPageRoute(builder: (context) {
      return const Center(
        child: Text("暂无此页面"),
      );
    });
  }
}
