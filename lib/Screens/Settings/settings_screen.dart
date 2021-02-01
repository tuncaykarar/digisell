import 'package:digisell/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:digisell/components/app_drawer.dart';
import 'package:digisell/components/app_bar.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';
  final _formKey = GlobalKey<FormState>();

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
    return Scaffold(
      appBar: AppBarWrapped(title: Text('Enter Integration Info')),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'API User Name'),
              ),
              Divider(),
              TextFormField(
                decoration: InputDecoration(labelText: 'API User Password'),
              ),
              Divider(),
              TextFormField(
                decoration: InputDecoration(labelText: 'API Key'),
              ),
              Divider(),
              TextFormField(
                decoration: InputDecoration(labelText: 'API Secret'),
              ),
              Divider(),
              RoundedButton(
                text: "SIGNUP",
                press: () {
                  _saveForm(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
