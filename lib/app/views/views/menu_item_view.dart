import 'package:flutter/material.dart';

import 'package:get/get.dart';


class MenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const MenuItem({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}