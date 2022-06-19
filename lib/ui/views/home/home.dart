import 'package:flutter/material.dart';

import 'package:favorcate/ui/views/home/home_content.dart';
import './home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(context),
      body: const Center(
        child: HomeContent(),
      ),
    );
  }
}
