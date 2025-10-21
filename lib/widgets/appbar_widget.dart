import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(title:  Text(title), centerTitle: true);
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
