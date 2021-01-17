import 'package:flutter/material.dart';
import 'package:digisell/Screens/Welcome/components/body.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
