import 'package:favorcate/core/viewmodel/filter_view_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'core/viewmodel/favor_view_model.dart';
import 'core/viewmodel/meal_view_model.dart';

void main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (create) => FilterViewModel()),
      ChangeNotifierProxyProvider<FilterViewModel, MealViewModel>(
        create: (create) => MealViewModel(),
        update: (ctx, filterVM, mealVM) {
          mealVM!.updateFilters(filterVM);
          return mealVM;
        },
      ),
      ChangeNotifierProxyProvider<FilterViewModel, FavorViewModel>(
        create: (create) => FavorViewModel(),
        update: (ctx, filterVM, favorVM) {
          favorVM!.updateFilters(filterVM);
          return favorVM;
        },
      ),
      // ChangeNotifierProvider(create: (create) => FilterViewModel())
    ],
    child: const MyApp(),
  ));
}
