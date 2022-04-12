// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class SidebarButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final double textSize;
  final double height;

  SidebarButton(
      {required this.text,
      required this.iconData,
      required this.textSize,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Icon(
            iconData,
            color: Colors.black45,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.black45, fontSize: textSize),
          )
        ],
      ),
      onPressed: () {},
    );
  }
}
