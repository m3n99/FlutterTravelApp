import 'package:flutter/material.dart';
import 'package:travelapp/utils/app_layout.dart';

class AppButtons extends StatelessWidget {
  final Color? color;
  String? text;
  IconData? icon;
  final Color? bgColor;
  double? size;
  final Color borderColor;
  bool? isIcon; // false mean use a text / true mean use an icon

   AppButtons({
    Key? key,  this.color,  this.bgColor, 
     required this.borderColor,
    this.size, this.text="Hi",  this.icon, this.isIcon=false,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
          borderRadius: BorderRadius.circular(
            AppLayout.getHeight(20),
          ),
          color: bgColor,
          ),
          child: isIcon==false?Center(child: Text(text!,style: TextStyle(color: color),)):Center(child: Icon(icon,color: color,)),
    );
  }
}
