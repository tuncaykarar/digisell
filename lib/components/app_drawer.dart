import 'package:flutter/material.dart';
import 'package:digisell/Screens/OrderList/order_list.dart';
import 'package:digisell/Screens/Settings/settings_screen.dart';
import 'package:digisell/Screens/Login/login_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        AppBar(
          title: Text('Hi My Friend!'),
          automaticallyImplyLeading: false,
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.shop),
          title: Text('Orders'),
          onTap: () {
            Navigator.of(context)
                  .pushReplacementNamed(OrderListScreen.routeName);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {
            Navigator.of(context)
                  .pushReplacementNamed(SettingsScreen.routeName);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Logout'),
          onTap: () {
            Navigator.of(context)
                  .pushReplacementNamed(LoginScreen.routeName);
          },
        ),
      ]),
    );
  }
}
