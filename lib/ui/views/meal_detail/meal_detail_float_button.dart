import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealDetailFloatButton extends StatelessWidget {
  final MealMadel meal;
  const MealDetailFloatButton(this.meal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FavorViewModel>(
      builder: (context, favorVm, child) {
        // 1. 判断是否是收藏状态

        bool isFavor = favorVm.isFavor(meal);
        IconData iconData = isFavor ? Icons.favorite : Icons.favorite_border;
        Color iconColor = isFavor ? Colors.red : Colors.white;

        return FloatingActionButton(
          backgroundColor: Colors.amber,
          child: Icon(
            iconData,
            color: iconColor,
          ),
          onPressed: () {
            favorVm.handleMeal(meal);
          },
        );
      },
    );
  }
}
