import 'package:flutter/material.dart';

import '../../core/constants/dismension_config.dart';
import '../../core/constants/textstyle.dart';

class LoginGoogle extends StatelessWidget {
  final String content;
  const LoginGoogle({
    super.key,
    required this.content
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMediumPadding, vertical: kMediumPadding),
      child: Row(
        children:  [
          const Expanded(
            child: Divider(
              color: Color.fromRGBO(189, 189, 189, 1),
              thickness: 2,
            ),
          ),
          const SizedBox(width: 10),
          Text(content, style: TextStyles.textApp),
          const SizedBox(width: 10),
          const Expanded(
            child: Divider(
              color: Color.fromRGBO(189, 189, 189, 1),
              thickness: 2,
            ),
          ),


        ],
      ),
    );
  }
}