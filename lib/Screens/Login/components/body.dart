import 'package:flutter/material.dart';
import 'package:digisell/Screens/Login/components/background.dart';
import 'package:digisell/Screens/Signup/signup_screen.dart';
import 'package:digisell/components/already_have_an_account_acheck.dart';
import 'package:digisell/components/rounded_button.dart';
import 'package:digisell/components/rounded_email_input_field.dart';
import 'package:digisell/components/rounded_password_field.dart';
import 'package:digisell/utilities/rest_service_utility.dart';
import 'package:digisell/Screens/OrderList/order_list.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:convert';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  var _email = '';
  var _password = '';

  void _saveForm(context) {
    _formKey.currentState.validate();
    _formKey.currentState.save();
    print(this._email);
    print(this._password);

    final url = 'http://10.0.2.2:8081/users/login';
    var _jsonObject = json.encode({
      'username': this._email,
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
    return Background(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedEmailInputField(
                hintText: "Your Email",
                onChanged: (value) {
                  this._email=value;
                },
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  this._password=value;
                },
              ),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  _saveForm(context);
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.of(context)
                      .pushReplacementNamed(SignUpScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
