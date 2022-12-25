import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tokoto_commerce_app/components/default_button.dart';
import 'package:flutter_tokoto_commerce_app/components/no_account_text.dart';
import 'package:flutter_tokoto_commerce_app/constant.dart';
import 'package:flutter_tokoto_commerce_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_tokoto_commerce_app/screens/sign_in/components/sign_form.dart';
import 'package:flutter_tokoto_commerce_app/screens/sign_in/components/social_card.dart';
import 'package:flutter_tokoto_commerce_app/size_config.dart';
import '../../../components/custom_suffix_icon.dart';
import '../../../components/form_error.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.04,
              ),
              Text(
                'Welcome Back',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Sign in with your mail and password \nor continue with social media',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.08,
              ),
              SignForm(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.08,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    icon: 'assets/icons/google-icon.svg',
                    press: () {},
                  ),
                  SocialCard(
                    icon: 'assets/icons/facebook-2.svg',
                    press: () {},
                  ),
                  SocialCard(
                    icon: 'assets/icons/twitter.svg',
                    press: () {},
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              NoAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}

