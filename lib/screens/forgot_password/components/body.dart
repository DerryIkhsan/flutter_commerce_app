import 'package:flutter/material.dart';
import 'package:flutter_tokoto_commerce_app/components/custom_suffix_icon.dart';
import 'package:flutter_tokoto_commerce_app/components/default_button.dart';
import 'package:flutter_tokoto_commerce_app/components/form_error.dart';
import 'package:flutter_tokoto_commerce_app/components/no_account_text.dart';
import 'package:flutter_tokoto_commerce_app/size_config.dart';

import '../../../constant.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Please enter your email and we will send \nyou a link to return your account",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1,),
              ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  ForgotPassForm({Key key}) : super(key: key);

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey ,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                setState(() {
                  errors.remove(kEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
              return null;
            },
            validator: (value) {
              if (value.isEmpty && !errors.contains(kEmailNullError)) {
                setState(() {
                  errors.add(kEmailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your mail",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Mail.svg'),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30),),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1,),
          DefaultButton(
            text: "Continue",
            press: () {
              if(_formKey.currentState.validate()){
                // do what you want to do
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1,),
          NoAccountText(),
        ],
      ),
    );
  }
}
