import 'package:favorcate/ui/views/favor/facor.dart';
import 'package:favorcate/ui/views/home/home.dart';
import 'package:flutter/material.dart';

const List<Widget> pages = [
  HomeScreen(),
  FavorScreen(),
];
const List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: "首页",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.star),
    label: "收藏",
  ),
];
