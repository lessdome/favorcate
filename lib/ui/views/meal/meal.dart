import 'package:flutter/material.dart';

import 'package:favorcate/core/model/category_model.dart';

import 'meal_content.dart';

class MealScreen extends StatelessWidget {
  static const String routeName = "/meal";

  const MealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 获取参数
    CategoryModel category =
        ModalRoute.of(context)?.settings.arguments as CategoryModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title!),
      ),
      body: MealContent(category),
    );
  }
}
