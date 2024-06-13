import 'package:flutter/material.dart';

import '../../core/constants/color_config.dart';
import '../../core/constants/dismension_config.dart';

class InputPassWord extends StatefulWidget {
  const InputPassWord({
    super.key,
    required TextEditingController controllerPassWord,
  }) : _controllerPassWord = controllerPassWord;

  final TextEditingController _controllerPassWord;

  @override
  State<InputPassWord> createState() => _InputPassWordState();
}

class _InputPassWordState extends State<InputPassWord> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
      child: TextFormField(
        controller: widget._controllerPassWord,
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: const TextStyle(fontSize: 15, color: ColorPalete.colorText, fontWeight: FontWeight.bold, fontFamily: 'Rubik'),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          suffixIcon:  IconButton(icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ), onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },),

        ),
        obscureText: _obscureText,
      ),
    );
  }
}