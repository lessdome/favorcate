import 'package:favorcate/core/viewmodel/filter_view_modal.dart';
import 'package:favorcate/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterContent extends StatelessWidget {
  const FilterContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildChoiseTitle(context),
        buildChoiseSelect(),
      ],
    );
  }

  Widget buildChoiseTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        SizeFit.setPx(20),
      ),
      alignment: Alignment.center,
      child: Text(
        "展示你的选择",
        style: Theme.of(context)
            .textTheme
            .displayLarge
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildChoiseSelect() {
    return Expanded(
      child: Consumer<FilterViewModel>(
        builder: (context, filterVM, child) => ListView(
          children: [
            buildListTile(
              "五谷蛋白",
              "展示五谷蛋白食物",
              filterVM.isGlutenFree,
              (bool value) {
                filterVM.isGlutenFree = value;
              },
            ),
            buildListTile(
              "不含乳糖",
              "展示不含乳糖食物",
              filterVM.isLactoseFree,
              (bool value) {
                filterVM.isLactoseFree = value;
              },
            ),
            buildListTile(
              "普通素食者",
              "展示普通素食者食物",
              filterVM.isVegetarian,
              (bool value) {
                filterVM.isVegetarian = value;
              },
            ),
            buildListTile(
              "严格素食者",
              "展示严格素食者食物",
              filterVM.isVegan,
              (bool value) {
                filterVM.isVegan = value;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListTile(String title, String subtitle, bool value,
      void Function(bool value) onChanged) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Switch(
        onChanged: onChanged,
        value: value,
      ),
    );
  }
}
