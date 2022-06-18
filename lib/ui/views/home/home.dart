import 'package:favorcate/ui/views/home/home_content.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("美食广场"),
      ),
      body: const Center(
        child: HomeContent(),
      ),
    );
  }
}
