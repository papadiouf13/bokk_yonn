import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  String labelle;
  double size;
  Color? color;
  FontWeight fontWeight;
  TextAlign textAlign;
  AppText({Key? key, required this.labelle, this.size= 15, this.color, this.fontWeight= FontWeight.w500, this.textAlign= TextAlign.center}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(labelle, style: TextStyle(fontSize: size, color: color, fontWeight: fontWeight), textAlign: textAlign);
  }
}
