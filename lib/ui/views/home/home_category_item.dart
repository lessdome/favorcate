import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/ui/shared/size_fit.dart';
import 'package:favorcate/ui/views/meal/meal.dart';
import 'package:flutter/material.dart';

class HomeCategoryItem extends StatelessWidget {
  final CategoryModel category;

  const HomeCategoryItem(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        key: Key("${category.id}-$category"),
        decoration: BoxDecoration(
            color: category.cColor,
            borderRadius: BorderRadius.circular(SizeFit.setPx(12)),
            gradient: LinearGradient(colors: [
              category.cColor!.withOpacity(0.7),
              category.cColor!,
            ])),
        alignment: Alignment.center,
        child: Text(
          category.title!,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, MealScreen.routeName, arguments: category);
      },
    );
  }
}
