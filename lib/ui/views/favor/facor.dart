import 'package:flutter/material.dart';

import 'favor_content.dart';

class FavorScreen extends StatelessWidget {
  const FavorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ζηζΆθ"),
      ),
      body: const FavorContent(),
    );
  }
}
