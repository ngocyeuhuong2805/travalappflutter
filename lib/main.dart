import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_app/core/constants/color_config.dart';
import 'package:travel_app/core/helpers/local_storage_helper.dart';
import 'package:travel_app/representasion/screens/home_app.dart';
import 'package:travel_app/representasion/screens/home_screen.dart';
import 'package:travel_app/representasion/screens/splash_screen.dart';
import 'package:travel_app/routes.dart';

void main() async {
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorageHelper();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: ColorPalete.secondColor,
    statusBarBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(
        primaryColor: ColorPalete.primaryColor,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: ColorPalete.bgScaffoldColor,
          backgroundColor: ColorPalete.bgScaffoldColor,
      ),
      debugShowCheckedModeBanner: false,
      routes: routes,
      onGenerateRoute: generateRoutes,
      home: const SplashScreenPage(),
    );
  }
}


