import 'package:flutter/material.dart';

import 'package:favorcate/core/model/meal_model.dart';

import 'meal_detail_content.dart';
import 'meal_detail_float_button.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = "/meal-detail";

  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MealMadel meal = ModalRoute.of(context)?.settings.arguments as MealMadel;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: MealDetailContent(meal),
      floatingActionButton: MealDetailFloatButton(meal),
    );
  }
}
