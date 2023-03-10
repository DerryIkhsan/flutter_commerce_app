import 'package:flutter/material.dart';
import 'package:flutter_tokoto_commerce_app/components/custom_suffix_icon.dart';
import 'package:flutter_tokoto_commerce_app/components/default_button.dart';
import 'package:flutter_tokoto_commerce_app/components/form_error.dart';
import 'package:flutter_tokoto_commerce_app/screens/otp/otp_screen.dart';

import '../../../constant.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  CompleteProfileForm({Key key}) : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  String firstName, lastName, phoneNumber, address;
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
          buildFirstNameFormField(),
          SizedBox(
            height: getProportionateScreenWidth(30),
          ),
          buildLastNameFormField(),
          SizedBox(
            height: getProportionateScreenWidth(30),
          ),
          buildPhoneNumberFormField(),
          SizedBox(
            height: getProportionateScreenWidth(30),
          ),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateScreenWidth(30),
          ),
          DefaultButton(
            text: "Continue",
            press: (){
              if(_formKey.currentState.validate()){
                // Go to OTP Screen
                Navigator.pushNamed(context, OTPScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
          onSaved: (newValue) => address = newValue,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kAddressNullError);
            }
            return null;
          },
          validator: (value) {
            if (value.isEmpty) {
              addError(error: kAddressNullError);
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Address",
            hintText: "Enter your address",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Location point.svg'),
          ),
        );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
          keyboardType: TextInputType.number,
          onSaved: (newValue) => phoneNumber = newValue,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kPhoneNumberNullError);
            }
            return null;
          },
          validator: (value) {
            if (value.isEmpty) {
              addError(error: kPhoneNumberNullError);
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Phone Number",
            hintText: "Enter your phone number",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Phone.svg'),
          ),
        );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
          keyboardType: TextInputType.emailAddress,
          onSaved: (newValue) => lastName = newValue,
          decoration: InputDecoration(
            labelText: "Last Name",
            hintText: "Enter your last name",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/User.svg'),
          ),
        );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/User.svg'),
      ),
    );
  }
}