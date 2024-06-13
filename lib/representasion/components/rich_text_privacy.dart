import 'package:flutter/material.dart';

import '../../core/constants/dismension_config.dart';
import '../../core/constants/textstyle.dart';

class RichTextPrivacy extends StatelessWidget {
  const RichTextPrivacy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMediumPadding, vertical: kMediumPadding),
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          style: TextStyles.defaultStyle,
          children: [
            TextSpan(
              text: 'By tapping sign up you agree to the ',
            ),
            TextSpan(
              text: 'Terms and\nCondition ',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'and ',
            ),
            TextSpan(
              text: 'Privacy Policy ',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'of this app ',
            ),
          ],
        ),
      ),
    );
  }
}