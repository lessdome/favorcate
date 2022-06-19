import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/services/http_request.dart';

class MealRequest {
  static const String url = "/meal";

  static Future<List<MealMadel>> getMealData() async {
    // 1. 发送网络请求
    final result = await HttpRequest.request(
      url,
    );

    // 2. json 转 modal
    final mealArray = result["meal"];
    List<MealMadel> meals = [];

    for (var item in mealArray) {
      meals.add(MealMadel.fromJson(item));
    }

    return meals;
  }
}
