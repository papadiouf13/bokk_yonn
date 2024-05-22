import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppButton extends StatelessWidget {
  final Widget child;
  final dynamic onPressed;
  final Color backgroundColor;
  final Color borderColor;
  dynamic width;
  dynamic height;
  dynamic radius ;

   AppButton({
    super.key,
    this.onPressed,
    required this.width,
     this.height = 70.0,
    required this.child,
    required this.backgroundColor,
    required this.borderColor,
     this.radius =  10.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor,
          border: Border.all(width: 2, color: borderColor)
        ),
        child: Center(child: child)
        ),
    );
  }
}