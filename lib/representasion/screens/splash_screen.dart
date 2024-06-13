import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/textstyle.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/core/helpers/local_storage_helper.dart';
import 'package:travel_app/representasion/screens/intro_screen.dart';
import 'package:travel_app/representasion/screens/login.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);
  static const String routeName = '/splash_screen';

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    redirectIntroScreen(context);
  }
  @override
  void dispose() {
    _controller.dispose(); // Dispose controller when not needed
    super.dispose();
  }

  void redirectIntroScreen(BuildContext context)  async {
    final ignoreIntrolScreen = LocalStorageHelper.getValue('ignoreIntrolScreen') as bool? ;
    await Future.delayed(const Duration(seconds: 2));

    if(ignoreIntrolScreen != null && ignoreIntrolScreen) {
      Navigator.of(context).pushNamed(Login.routeName);
    }else{
      LocalStorageHelper.setValue('ignoreIntrolScreen', true);
      Navigator.of(context).pushNamed(IntroScreen.routeName);
    }
    // Navigator.push(context, MaterialPageRoute(builder: (context) => IntroScreen()));


  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: ImageHelper.loadFormAsset(AssetHelper.imagebgsplash,
                fit: BoxFit.fitWidth)),
        Positioned.fill(
            child: RotationTransition(
                turns: _controller, child: ImageHelper.loadFormAsset(AssetHelper.circle))),
        Container(
            alignment: Alignment.center,
            child:  Text('Travel',
                style: TextStyles.headerTitle.bold.whiteTextColor,
                )) // Loại bỏ dấu gạch ngang
      ],
    );
  }
}