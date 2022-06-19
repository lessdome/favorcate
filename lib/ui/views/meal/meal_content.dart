import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/meal_view_model.dart';

import 'package:favorcate/ui/widgets/meal_item.dart';

// class MealContent extends StatelessWidget {
//   final CategoryModel category;
//   const MealContent(this.category, {Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<MealViewModel>(builder: (context, mealVM, child) {
//       List<MealMadel> meals = mealVM.meals;
//       List<MealMadel> mealsCurrent = meals
//           .where(
//             (meal) => meal.categories.contains(category.id),
//           )
//           .toList();

//       return ListView.builder(
//         itemBuilder: (context, index) {
//           return MealItem(meals[index]);
//         },
//         itemCount: mealsCurrent.length,
//       );
//     });
//   }
// }

class MealContent extends StatelessWidget {
  final CategoryModel category;
  const MealContent(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<MealViewModel, List<MealMadel>>(
      selector: (context, mealVM) => mealVM.meals
          .where((item) => item.categories.contains(category.id))
          .toList(),
      shouldRebuild: (prev, next) => !listEquals(prev, next),
      builder: (context, meals, child) {
        return ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) {
            return MealItem(meals[index]);
          },
        );
      },
    );
  }
}
