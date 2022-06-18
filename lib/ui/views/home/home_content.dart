import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/core/services/json_parse.dart';

import 'package:flutter/material.dart';
import 'package:favorcate/ui/shared/size_fit.dart';

import 'home_category_item.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: JsonParse.getCategoryData(),
      builder:
          (BuildContext context, AsyncSnapshot<List<CategoryModel>> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.error != null) {
          return const Center(
            child: Text("数据请求失败"),
          );
        }

        List<CategoryModel> categories = snapshot.requireData;

        return GridView.builder(
          padding: EdgeInsets.all(
            SizeFit.setPx(20),
          ),
          itemCount: categories.length * 2,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: SizeFit.setPx(20),
            mainAxisSpacing: SizeFit.setPx(20),
            childAspectRatio: 1.5,
          ),
          itemBuilder: (context, index) {
            CategoryModel item = categories[index % categories.length];
            return HomeCategoryItem(item);
          },
        );
      },
    );
  }
}
