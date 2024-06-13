import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:travel_app/core/constants/color_config.dart';
import 'package:travel_app/core/constants/dismension_config.dart';
import 'package:travel_app/representasion/screens/home_screen.dart';
import 'package:travel_app/representasion/screens/profile_screen.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);
  static const routeName = 'home_app';

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  late int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeScreen(),
          Container(color: Colors.red),
          Container(color: Colors.yellow),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: ColorPalete.primaryColor,
        unselectedItemColor: ColorPalete.secondColor.withOpacity(0.2),
        margin: const EdgeInsets.symmetric(
            horizontal: kMediumPadding, vertical: kMediumPadding),
        items: [
          SalomonBottomBarItem(
              icon: const Icon(
                FontAwesomeIcons.houseUser,
                size: kDefaultIconSize,
              ),
              title: const Text('Home')),
          SalomonBottomBarItem(
              icon: const Icon(
                FontAwesomeIcons.solidHeart,
                size: kDefaultIconSize,
              ),
              title: const Text('Likes')),
          SalomonBottomBarItem(
              icon: const Icon(
                FontAwesomeIcons.briefcase,
                size: kDefaultIconSize,
              ),
              title: const Text('Booking')),
          SalomonBottomBarItem(
              icon: const Icon(
                FontAwesomeIcons.solidUser,
                size: kDefaultIconSize,
              ),
              title: const Text('Profile')),
        ],
      ),
    );
  }
}
