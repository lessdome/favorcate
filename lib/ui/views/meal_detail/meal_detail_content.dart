import 'dart:ui';

import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';

class MealDetailContent extends StatelessWidget {
  final MealMadel meal;

  const MealDetailContent(this.meal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: SizeFit.safeBottomHeight,
      ),
      child: Column(
        children: [
          buildBannerImage(),
          buildMakeTitle(context, "制作材料"),
          buildMakeMaterial(),
          buildMakeTitle(context, "制作步骤"),
          buildMakeSteps(),
        ],
      ),
    );
  }

  // 1. 横幅图片
  Widget buildBannerImage() {
    return Image.network(meal.imageUrl);
  }

  // 2. 制作材料
  Widget buildMakeMaterial() {
    return buildMakeContent(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: meal.ingredients.length,
        itemBuilder: (ctx, index) {
          return Card(
            color: Colors.amber,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeFit.setPx(5), horizontal: SizeFit.setPx(10)),
              child: Text(meal.ingredients[index]),
            ),
          );
        },
      ),
    );
  }

  // 3. 制作步骤
  Widget buildMakeSteps() {
    return buildMakeContent(
      child: ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text("#${index + 1}"),
              ),
              title: Text(meal.steps[index]),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: meal.steps.length),
    );
  }

  // title 组件
  Widget buildMakeTitle(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeFit.setPx(10),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  // 4.
  Widget buildMakeContent({required Widget child}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: SizeFit.setPx(30)),
      padding: EdgeInsets.all(SizeFit.setPx(8)),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(SizeFit.setPx(8)),
      ),
      child: child,
    );
  }
}
