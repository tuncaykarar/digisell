import 'package:flutter/material.dart';

class AppBarWrapped extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  final List<Widget> widgets;
  final Color backgroundColor = Colors.red;
  
  const AppBarWrapped({Key key, this.title, this.widgets})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: backgroundColor,
      actions: widgets,
    );
  }
  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}