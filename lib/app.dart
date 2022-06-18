import 'package:flutter/material.dart';
import 'core/router/router.dart';
import 'ui/shared/share_theme.dart';
import 'package:favorcate/ui/shared/size_fit.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeFit.initialze();

    return MaterialApp(
      title: "美食广场",
      theme: AppTheme.norTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: Routers.initialRoute,
      routes: Routers.routes,
      onGenerateRoute: Routers.generatorRoute,
      onUnknownRoute: Routers.unknowRoute,
    );
  }
}
