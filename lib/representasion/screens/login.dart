import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/color_config.dart';
import 'package:travel_app/core/constants/dismension_config.dart';
import 'package:travel_app/core/constants/textstyle.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representasion/screens/forgot_password.dart';
import 'package:travel_app/representasion/screens/home_app.dart';
import 'package:travel_app/representasion/screens/sign_up.dart';

import '../components/button_compoents.dart';
import '../components/header_form.dart';
import '../components/input_form.dart';
import '../components/input_password.dart';
import '../components/login_facebook.dart';
import '../components/login_google.dart';

class Login extends StatefulWidget {

  const Login({Key? key }) : super(key: key);
  static const routeName = 'login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassWord = TextEditingController();
  bool _rememberMe = false;
  bool isValidEmail(String email) {
    final RegExp emailRegExp = RegExp(
      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
    );
    return emailRegExp.hasMatch(email);
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
              HeaderForm(size: size, title: 'Login', content: 'Hi, Welcome back!'),
              InputForm(lable: 'Email', controller: _controllerEmail, verticalPadding: kMediumPadding),
              InputPassWord(controllerPassWord: _controllerPassWord),

              Padding(
                  padding: const EdgeInsets.symmetric(vertical: kMediumPadding/2, horizontal: kMediumPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Transform.scale(
                            scale: 0.8, // Increase the scale to make the checkbox larger
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.white, // Background color of the Checkbox
                                borderRadius: BorderRadius.circular(4), // Rounded corners
                              ),
                              child: Checkbox(
                                value: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value ?? false;
                                  });
                                },
                                checkColor: ColorPalete.primaryColor,
                                visualDensity: VisualDensity.compact,
                                fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return Colors.white; // Màu của Checkbox khi được chọn
                                  }
                                  return Colors.white; // Màu của Checkbox khi không được chọn
                                }),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text('Remember me', style: TextStyles.textApp),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(ForgorPassword.routeName);
                        },
                        child: const Text('Forgot password?', style: TextStyles.textApp,),
                      ),
                    ],
                  ),
                ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kMinPadding*4),
                child: ButtonComponent(size: size, content: 'Login', onTap: (){
                  if (_controllerEmail.text.isEmpty || _controllerPassWord.text.isEmpty) {
                    // Hiển thị thông báo lỗi
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter your email and password.'),
                      ),
                    );
                  } else if (!isValidEmail(_controllerEmail.text)) {
                    // Hiển thị thông báo lỗi nếu email không đúng định dạng
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter a valid email address.'),
                      ),
                    );
                  } else {
                    // Chuyển sang màn hình tiếp theo
                    Navigator.of(context).pushNamed(HomeApp.routeName);
                  }
                },),
              ),
              const LoginGoogle(content: 'or log in with '),
              LoginFaceBook(size: size),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kMediumPadding, vertical: kMediumPadding),
                child: RichText(
                  text: TextSpan(
                    style: TextStyles.defaultStyle,
                    children: [
                      const TextSpan(
                        text: 'Don’t have an account?',
                      ),
                      TextSpan(
                        text: 'Sign Up ',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushNamed(SignUp.routeName);
                          },
                      ),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}







