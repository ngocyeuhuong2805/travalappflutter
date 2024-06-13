
import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dismension_config.dart';
import 'package:travel_app/representasion/components/button_compoents.dart';
import 'package:travel_app/representasion/components/input_form.dart';

import '../components/header_form.dart';
import 'login.dart';

class ForgorPassword extends StatefulWidget {

  const ForgorPassword({Key? key, }) : super(key: key);
  static const routeName = 'forgot_password';


  @override
  State<ForgorPassword> createState() => _ForgorPasswordState();
}

class _ForgorPasswordState extends State<ForgorPassword> {
  final TextEditingController _controllerEmail = TextEditingController();

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
              HeaderForm(size: size, title: 'Forgot Password', content: 'You’ll get messages soon on\nyour e-mail address'),
              InputForm(lable: 'Email', controller: _controllerEmail, verticalPadding: kMediumPadding,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kMinPadding*4),
                child: ButtonComponent(size: size, content: 'Send', onTap: (){
                  if (_controllerEmail.text.isEmpty) {
                    // Hiển thị thông báo lỗi
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter your email.'),
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
                    Navigator.of(context).pushNamed(Login.routeName);
                  }

                },),
              )
            ],
          ),
        ),
      ),
    );
  }
}
