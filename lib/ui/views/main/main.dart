import 'package:flutter/material.dart';

import 'initialize_items.dart';
import 'main_drawer.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = "/main";

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: pageIndex,
        unselectedFontSize: 14,
        selectedFontSize: 14,
        onTap: (int index) {
          if (index == pageIndex) return;
          setState(() {
            pageIndex = index;
          });
        },
      ),
      drawer: const MainDrawer(),
    );
  }
}
