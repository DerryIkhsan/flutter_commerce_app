import 'package:flutter/material.dart';
import 'package:flutter_tokoto_commerce_app/screens/sign_up/sign_up_screen.dart';
import 'package:flutter_tokoto_commerce_app/screens/splash/splash_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'routs.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}


