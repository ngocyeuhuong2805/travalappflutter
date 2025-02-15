import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/color_config.dart';



import '../../core/constants/dismension_config.dart';

class DashLineWidget extends StatelessWidget {
  const DashLineWidget({
    Key? key,
    this.height = 1,
    this.color = Colors.black26,
  }) : super(key: key);

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 6.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Padding(
          padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: List.generate(dashCount, (index) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: color,
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
