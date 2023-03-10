import 'package:flutter/material.dart';
import 'package:flutter_tokoto_commerce_app/screens/splash/splash_screen.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePic(),
        SizedBox(
          height: 20,
        ),
        ProfileMenu(
          icon: "assets/icons/User Icon.svg",
          text: "My Account",
          press: (){},
        ),
        ProfileMenu(
          icon: "assets/icons/Bell.svg",
          text: "Notification",
          press: (){},
        ),
        ProfileMenu(
          icon: "assets/icons/Settings.svg",
          text: "Settings",
          press: (){},
        ),
        ProfileMenu(
          icon: "assets/icons/User Icon.svg",
          text: "Help Center",
          press: (){},
        ),
        ProfileMenu(
          icon: "assets/icons/Log out.svg",
          text: "Log Out",
          press: () => Navigator.pushNamed(context, SplashScreen.routeName),
        ),
      ],
    );
  }
}