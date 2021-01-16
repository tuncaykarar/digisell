import 'package:flutter/material.dart';
import 'package:flutter_auth/components/app_drawer.dart';

class SettingsScreen extends StatelessWidget{
  static const routeName = '/settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Integration Info')
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'API Key'),
              ),
            ],
          ),
        ),
      ),
    );
  }
    
}