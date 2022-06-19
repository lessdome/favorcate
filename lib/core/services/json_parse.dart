import 'dart:convert';
import 'dart:io';

import 'package:favorcate/core/model/category_model.dart';
import 'package:flutter/services.dart';

class JsonParse {
  static Future<List<CategoryModel>> getCategoryData() async {
    // 1. 加载json文件
    String jsonString =
        await rootBundle.loadString("assets/json/category.json");

    // 2. 将jsonString转成map/list
    final result = json.decode(jsonString);

    // 3. 将map中的内容转成对象
    final resultList = result["category"];

    List<CategoryModel> categories = [];

    for (var json in resultList) {
      categories.add(CategoryModel.fromJson(json));
    }

    return categories;
  }
}
