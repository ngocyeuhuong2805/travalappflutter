import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StartComponent extends StatelessWidget {
  const StartComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.only(right: 4),
        child: FaIcon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellow,
          size: 10,
        ));
  }
}