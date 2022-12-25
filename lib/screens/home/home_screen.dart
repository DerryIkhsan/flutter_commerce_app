import 'package:flutter/material.dart';
import 'package:flutter_tokoto_commerce_app/screens/home/components/body.dart';
import '../profile/components/custom_bottom_navbar.dart';
import '../../enums.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.home,
      ),
    );
  }
}