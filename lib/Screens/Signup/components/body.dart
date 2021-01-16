import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/Screens/Signup/components/or_divider.dart';
import 'package:flutter_auth/Screens/Signup/components/social_icon.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Body extends StatelessWidget {
  final FocusNode _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  var _email = "";
  var _password = "";

  void _saveForm(context) {
    _formKey.currentState.validate();
    _formKey.currentState.save();
    print(this._email);
    print(this._password);

    final url = 'http://10.0.2.2:8080/api/users/signup';
    var _jsonObject = json.encode({
      'username': this._email,
      'email': this._email,
      'password': this._password
    });

    callRestPostService(context: context, url: url, jsonObject: _jsonObject);
  }

  callRestPostService(
      {@required final context,
      @required final url,
      Map<String, String> headers,
      @required final jsonObject}) {
    //necessary for BE content type, witout this BE rejetcs because of content type
    Map _headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    //TODO:fix below line
    // headers??_headers.addAll(headers);
    final _jsonObject = jsonObject;
    http.post(url, headers: _headers, body: _jsonObject).then((response) {
      handleRestResponse(context, response, (context, input) {
        //TODO: navigate to the main screen
        showAlertDialog(context: context, message: input);
      });
    }).catchError((error) {
      print(error);
    });
  }

  handleRestResponse(context, response, Function nextStep) {
    print('response: ' + response.body);
    if (response.statusCode == 200) {
      nextStep?.call(context,'messagim');
    } else {
      handleRestError(context, response);
    }
  }

  handleRestError(context, response) {
    var _message = 'Sorry an error occured...';
    if (response.statusCode == 500) {
      //TODO: get error from response
      //var _serverErrorMessage = response['error'];
      //_message = _serverErrorMessage ??= 'Sorry an error occured...';
      _message = 'Sorry an error occured...';
    }
    showAlertDialog(context: context, message: _message);
    throw Exception(_message);
  }

  showAlertDialog({BuildContext context, String message}) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Message"),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
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
              RoundedInputField(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
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
