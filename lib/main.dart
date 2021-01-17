import 'package:flutter/material.dart';
import 'package:digisell/Screens/Welcome/welcome_screen.dart';
import 'package:digisell/constants.dart';
import 'Screens/Login/login_screen.dart';
import 'Screens/OrderList/order_list.dart';
import 'Screens/Settings/settings_screen.dart';
import 'Screens/Signup/signup_screen.dart';
import 'app_config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    setEnvironment(Environment.dev);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digisell',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
      routes: {
        WelcomeScreen.routeName: (context) => WelcomeScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        OrderListScreen.routeName: (context) => OrderListScreen(),
        SettingsScreen.routeName: (context) => SettingsScreen(),
      },
    );
  }
}
