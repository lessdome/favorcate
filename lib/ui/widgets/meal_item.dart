import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:favorcate/ui/views/meal_detail/meal_detail.dart';
import 'package:favorcate/ui/widgets/operation_item.dart';
import 'package:favorcate/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<String> OperationName = [
  "简单",
  "中等",
  "困难",
];

class MealItem extends StatelessWidget {
  final MealMadel meal;

  const MealItem(this.meal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(SizeFit.setPx(10)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SizeFit.setPx(12),
          ),
        ),
        child: Column(
          children: [
            buildBasicInfo(context),
            buildOperaitonInfo(),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          MealDetailScreen.routeName,
          arguments: meal,
        );
      },
    );
  }

  Widget buildBasicInfo(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          child: Image.network(
            meal.imageUrl,
            fit: BoxFit.cover,
            repeat: ImageRepeat.noRepeat,
            loadingBuilder: (context, child, event) {
              if (event == null) return child;

              double value =
                  (event.cumulativeBytesLoaded / event.expectedTotalBytes!);

              return SizedBox(
                height: SizeFit.setPx(250),
                child: Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                    value: value,
                  ),
                  // child: CircularProgressIndicator(),
                ),
              );
            },
            errorBuilder: (ctx, obj, rich) {
              return SizedBox(
                height: SizeFit.setPx(250),
                child: const Center(
                  child: Icon(
                    Icons.local_dining,
                    size: 30,
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: SizeFit.setPx(10),
          right: SizeFit.setPx(10),
          child: Container(
            width: SizeFit.setPx(300),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(SizeFit.setPx(6)),
            ),
            child: Text(
              meal.title,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildOperaitonInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        OperationItem(
          "${meal.duration}分钟",
          const Icon(Icons.schedule),
        ),
        OperationItem(
          OperationName[meal.complexity],
          const Icon(Icons.restaurant),
        ),
        buildFavorItem(meal),
      ],
    );
  }

  Widget buildFavorItem(MealMadel meal) {
    return Consumer<FavorViewModel>(
      builder: (context, favorVM, child) {
        // 判断收藏状态
        bool isFavor = favorVM.isFavor(meal);
        IconData iconData = isFavor ? Icons.favorite : Icons.favorite_border;
        Color iconColor = isFavor ? Colors.red : Colors.black;
        String title = isFavor ? "已收藏" : "未收藏";

        return GestureDetector(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: SizeFit.setPx(16),
            ),
            child: OperationItem(
              title,
              Icon(
                iconData,
                color: iconColor,
              ),
              textColor: iconColor,
            ),
          ),
          onTap: () {
            favorVM.handleMeal(meal);
          },
        );
      },
    );
  }
}
