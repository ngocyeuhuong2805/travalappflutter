import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/textstyle.dart';

import '../../core/constants/color_config.dart';
import '../../core/constants/dismension_config.dart';

class InputForm extends StatelessWidget {
  final double verticalPadding;
  final String lable;
  const InputForm({
    Key? key,
    required this.lable,
    required TextEditingController controller,
    required this.verticalPadding,
  }) : _controllerEmail = controller, super(key: key);

  final TextEditingController _controllerEmail;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kMediumPadding, vertical: verticalPadding),
      child: TextFormField(
        style: TextStyles.textApp.bold,
        controller: _controllerEmail,
        decoration: InputDecoration(
          labelText: lable,
          labelStyle: const TextStyle(fontSize: 15, color: ColorPalete.colorText, fontWeight: FontWeight.bold, fontFamily: 'Rubik'),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)), // Sửa thành Radius.circular(16)
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ColorPalete.primaryColor, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          filled: true,
          enabledBorder: InputBorder.none,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}