// ignore_for_file: sort_child_properties_last

import 'package:favorcate/ui/shared/size_fit.dart';
import 'package:favorcate/ui/views/filter/fliter.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          buildHeaderView(context),
          buildListTile(
            context,
            const Icon(Icons.restaurant),
            "进餐",
            () {
              Navigator.of(context).pop();
            },
          ),
          buildListTile(
            context,
            const Icon(Icons.settings),
            "过滤",
            () {
              Navigator.of(context).pushNamed(FilterScreen.routeName);
            },
          ),
        ],
      ),
    );
  }

  Widget buildHeaderView(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeFit.setPx(120),
      alignment: const Alignment(0, 0.5),
      margin: EdgeInsets.only(
        bottom: SizeFit.setPx(20),
      ),
      child: Text(
        "开始动手",
        style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
      ),
      color: Colors.orange,
    );
  }

  Widget buildListTile(BuildContext context, Widget icon, String title,
      void Function() handler) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: Theme.of(context).textTheme.displayMedium,
      ),
      onTap: handler,
    );
  }
}
