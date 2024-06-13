import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/core/constants/dismension_config.dart';
import 'package:travel_app/core/constants/textstyle.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representasion/screens/home_app.dart';
import 'package:travel_app/representasion/widgets/button_widget.dart';

import 'login.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);
  static String routeName = '/intro_screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  final StreamController<int> _streamController =
      StreamController<int>.broadcast();

  @override
  void initState() {
    // TODO: implement initState
    _pageController.addListener(() {
      // theo dõi xem người dùng đã đi đến page nào
      _streamController.add(_pageController.page!.toInt());
    });
  }

  Widget _buildItemIntroScreen(String image, String title, String description,
      AlignmentGeometry alignment) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // cho ảnh ra giữa
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: alignment,
          child: ImageHelper.loadFormAsset(image,
              height: 410, fit: BoxFit.fitHeight),
        ),
        const SizedBox(
          height: kMediumPadding * 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kMediumPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Text(
                description,
                style: TextStyles.defaultStyle,
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              _buildItemIntroScreen(
                  AssetHelper.anhh1,
                  'Book a flight',
                  'Found a flight that matches your destination\nand schedule? Book it instantly.',
                  Alignment.centerRight),
              _buildItemIntroScreen(
                  AssetHelper.anh2,
                  'Find a hotel room',
                  'Select the day, book your room. We give you \nthe best price..',
                  Alignment.center),
              _buildItemIntroScreen(
                  AssetHelper.anh3,
                  'Enjoy your trip',
                  'Easy discovering new places and share these \nbetween your friends and travel together.',
                  Alignment.centerLeft),
            ],
          ),
          Positioned(
              bottom: kMediumPadding * 3,
              left: kMediumPadding,
              right: kMediumPadding,
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                        dotWidth: kMinPadding,
                        dotHeight: kMinPadding,
                        activeDotColor: Colors.orange,
                      ),
                    ),
                  ),
                  StreamBuilder<int>(
                      stream: _streamController.stream,
                      builder: (context, snapshot) {
                        return  Expanded(
                            flex: 4,
                            child: ButtonWidget(
                              title: snapshot.data != 2 ?  'Next' : 'Get Started',
                              ontap: (){
                                if(_pageController.page != 2) { // nếu page khác 2 thì nextPage bằng 2 thì chạy sang màn Home
                                  _pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
                                }else{
                                  Navigator.of(context).pushNamed(Login.routeName);
                                }
                              },
                            ));
                      })
                ],
              ))
        ],
      ),
    );
  }
}
