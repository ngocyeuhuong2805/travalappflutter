import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/representasion/components/button_compoents.dart';
import 'package:travel_app/representasion/components/header_form.dart';
import 'package:travel_app/representasion/components/input_form.dart';
import 'package:travel_app/representasion/components/login_facebook.dart';
import 'package:travel_app/representasion/components/login_google.dart';

import '../../core/constants/dismension_config.dart';
import '../../core/constants/textstyle.dart';
import '../components/rich_text_privacy.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static const routeName = 'sign_up';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerAdress = TextEditingController();
  final TextEditingController _controllerPassWord = TextEditingController();
  bool isValidEmail(String email) {
    final RegExp emailRegExp = RegExp(
      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
    );
    return emailRegExp.hasMatch(email);
  }
  bool isValidPhoneNumber(String phone) {
    final RegExp phoneRegExp = RegExp(
      r'^\+?[0-9]{10,13}$',
    );
    return phoneRegExp.hasMatch(phone);
  }
  void ValidateForm() {
    if (_controllerEmail.text.isEmpty
        || _controllerPassWord.text.isEmpty
        || _controllerPhone.text.isEmpty
        || _controllerAdress.text.isEmpty) {
      // Hiển thị thông báo lỗi
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter your email, phone number, and password.'),
        ),
      );
    } else if (!isValidEmail(_controllerEmail.text)) {
      // Hiển thị thông báo lỗi nếu email không đúng định dạng
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid email address.'),
        ),
      );
    } else if (!isValidPhoneNumber(_controllerPhone.text)) {
      // Hiển thị thông báo lỗi nếu số điện thoại không đúng định dạng
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid phone number.'),
        ),
      );
    } else {
      // Chuyển sang màn hình tiếp theo
      Navigator.of(context).pushNamed(Login.routeName);
    }
  }



  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 242, 246, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderForm(size: size, title: 'Sign Up', content: 'Let’s create your account!',),
              InputForm(controller: _controllerPhone, lable: 'Phone Number', verticalPadding: kMediumPadding),
              InputForm(lable: 'Email' , controller: _controllerEmail, verticalPadding: 0),
              InputForm(controller: _controllerAdress, lable: 'Address', verticalPadding: kMediumPadding),
              InputForm(controller: _controllerPassWord, lable: 'Password', verticalPadding: 0),
              const RichTextPrivacy(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kMinPadding*4),
                child: ButtonComponent(size: size, content: 'Sign Up', onTap: (){ValidateForm();}),
              ),
              const LoginGoogle(content: 'or sign up with '),
              LoginFaceBook(size: size)

            ],
          ),
        ),
      ),
    );
  }
}

