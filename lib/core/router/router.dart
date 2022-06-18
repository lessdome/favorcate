import 'package:favorcate/ui/views/main/main.dart';
import 'package:flutter/material.dart';

class Routers {
  static const String initialRoute = MainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    MainScreen.routeName: (context) => const MainScreen(),
  };

  static final RouteFactory generatorRoute = (settings) {
    return null;
  };

  static final RouteFactory unknowRoute = (settings) {
    return null;
  };
}
