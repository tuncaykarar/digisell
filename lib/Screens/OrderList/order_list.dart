import 'package:flutter/material.dart';
import 'package:digisell/components/app_drawer.dart';
import 'package:digisell/components/app_bar.dart';

class OrderListScreen extends StatelessWidget{
  static const routeName = '/order-list';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWrapped(
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