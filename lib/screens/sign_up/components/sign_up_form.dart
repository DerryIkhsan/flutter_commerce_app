import 'package:flutter/material.dart';
import 'package:flutter_tokoto_commerce_app/components/custom_suffix_icon.dart';
import 'package:flutter_tokoto_commerce_app/components/default_button.dart';
import 'package:flutter_tokoto_commerce_app/components/form_error.dart';
import 'package:flutter_tokoto_commerce_app/screens/complete_profile/complete_profile_screen.dart';

import '../../../constant.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String email, password, confirm_password;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildPasswordFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildConfirmPasswordFormField(),
          FormError(errors: errors,),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          DefaultButton(
            text: "Continue",
            press: (){
              if(_formKey.currentState.validate()){
                // Go to complete profile page
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);

              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
          obscureText: true,
          onSaved: (newValue) => confirm_password = newValue,
          onChanged: (value) {
            if (password == confirm_password) {
              removeError(error: kMatchPassError);
            } else if (value.length >= 8) {
              removeError(error: kShortPassError);
            }
            confirm_password = value;
            return null;
          },
          validator: (value) {
            if (value.isEmpty ){
              return "";
            } else if (password != confirm_password){
              addError(error: kMatchPassError);
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Confirm Password",
            hintText: "Re-enter your password",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Lock.svg'),
          ),
        );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
          obscureText: true,
          onSaved: (newValue) => password = newValue,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kPassNullError);
            } else if (value.length >= 8) {
              removeError(error: kShortPassError);
            }
            password = value;
            return null;
          },
          validator: (value) {
            if (value.isEmpty) {
              addError(error: kPassNullError);
              return "";
            } else if (value.length < 8) {
              addError(error: kShortPassError);
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Enter your password",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Lock.svg'),
          ),
        );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
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
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your mail",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Mail.svg'),
      ),
    );
  }
}