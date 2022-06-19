import 'package:favorcate/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';

class OperationItem extends StatelessWidget {
  final Widget icon;
  final String title;
  final Color? textColor;

  const OperationItem(this.title, this.icon,
      {this.textColor = Colors.black, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: SizeFit.setPx(3),
        ),
        Text(
          title,
          style:
              Theme.of(context).textTheme.bodySmall?.copyWith(color: textColor),
        )
      ],
    );
  }
}
