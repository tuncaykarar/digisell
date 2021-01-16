import 'package:flutter/material.dart';
import 'package:flutter_auth/components/app_drawer.dart';

class OrderListScreen extends StatelessWidget{
  static const routeName = '/order-list';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Text('List your orders here')
      ),
    );
  }
  


}