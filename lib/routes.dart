

import 'package:flutter/material.dart';
import 'package:travel_app/core/model/hotel_model.dart';
import 'package:travel_app/representasion/screens/booking_room.dart';
import 'package:travel_app/representasion/screens/detail_destinations.dart';
import 'package:travel_app/representasion/screens/detail_hotel_screen.dart';
import 'package:travel_app/representasion/screens/forgot_password.dart';
import 'package:travel_app/representasion/screens/guest_and_room.dart';
import 'package:travel_app/representasion/screens/home_app.dart';
import 'package:travel_app/representasion/screens/hotel_screen.dart';
import 'package:travel_app/representasion/screens/hotels_booking.dart';
import 'package:travel_app/representasion/screens/intro_screen.dart';
import 'package:travel_app/representasion/screens/login.dart';
import 'package:travel_app/representasion/screens/select_date_screen.dart';
import 'package:travel_app/representasion/screens/sign_up.dart';
import 'package:travel_app/representasion/screens/splash_screen.dart';

final Map<String,  WidgetBuilder>  routes = {
  SplashScreenPage.routeName: (context) => const SplashScreenPage(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  Login.routeName: (context) =>  Login(),
  HomeApp.routeName: (context) => const HomeApp(),
  SignUp.routeName: (context) => const SignUp(),
  ForgorPassword.routeName: (context) =>  ForgorPassword(),
  HotelScreen.routeName: (context) =>  HotelScreen(),
  HotelBooking.routeName: (context) =>  HotelBooking(),
  SelectDateScreen.routeName: (context) =>  SelectDateScreen(),
  GuestAndRoomScreen.routeName: (context) =>  GuestAndRoomScreen(),
  DetailDestinations.routeName: (context) =>  DetailDestinations(),

};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings){
  switch (settings.name){
    case DetailHotelScreen.routeName:
      return MaterialPageRoute(builder: (context){
        final HotelModel hotelModel = (settings.arguments as HotelModel);
        return DetailHotelScreen(hotelModel: hotelModel);
      });
  }
}

