import 'package:flutter/material.dart';

class CategoryModel {
  String? id;
  String? title;
  String? color;
  Color? cColor;

  CategoryModel({this.id, this.title, this.color});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];

    // 1. 将color转成16进制的数字
    int colorInt = int.parse(color ?? "", radix: 16);
    // 2. 将透明度加上
    cColor = Color(colorInt | 0xFF000000);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['color'] = color;
    return data;
  }
}
