import 'package:flutter/material.dart';
import 'package:digisell/Screens/Login/login_screen.dart';
import 'package:digisell/Screens/OrderList/order_list.dart';
import 'package:digisell/Screens/Signup/components/background.dart';
import 'package:digisell/Screens/Signup/components/or_divider.dart';
import 'package:digisell/Screens/Signup/components/social_icon.dart';
import 'package:digisell/components/already_have_an_account_acheck.dart';
import 'package:digisell/components/rounded_button.dart';
import 'package:digisell/components/rounded_email_input_field.dart';
import 'package:digisell/components/rounded_password_field.dart';
import 'package:digisell/utilities/rest_service_utility.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:convert';

class Body extends StatelessWidget {
  final FocusNode _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  var _email = '';
  var _password = '';

  void _saveForm(context) {
    _formKey.currentState.validate();
    _formKey.currentState.save();
    print(this._email);
    print(this._password);

    final url = 'http://10.0.2.2:8081/users/signup';
    var _jsonObject = json.encode({
      'username': this._email,
      'email': this._email,
      'password': this._password
    });

    RestServiceUtility.callRestPostService(
        context: context,
        url: url,
        jsonObject: _jsonObject,
        afterSuccess: (context, input) {
          Navigator.of(context).pushReplacementNamed(OrderListScreen.routeName);
          // showAlertDialog(context: context, message: input);
        });
  }

  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "SIGNUP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/signup.svg",
                height: size.height * 0.35,
              ),
              RoundedEmailInputField(
                hintText: "Your Email",
                onChanged: (value) {
                  this._email = value;
                },
                nextFocusNode: _passwordFocusNode,
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  this._password = value;
                },
                passwordFocusNode: _passwordFocusNode,
              ),
              RoundedButton(
                text: "SIGNUP",
                press: () {
                  _saveForm(context);
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.of(context)
                      .pushReplacementNamed(LoginScreen.routeName);
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
