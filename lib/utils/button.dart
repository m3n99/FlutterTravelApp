// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:travelapp/utils/app_layout.dart';
import 'package:travelapp/utils/app_styles.dart';

class AppButton extends StatelessWidget {
  bool isResponsive;
  double? width;
  AppButton({Key? key, this.isResponsive =false, this.width = 120})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.symmetric(vertical:AppLayout.getHeight(10),
        horizontal:AppLayout.getWidth(20) ),
        width: isResponsive==true?double.maxFinite:width,
        height: AppLayout.getHeight(60),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppLayout.getHeight(10)),
          color: Styles.mainColor
        ),
        child: Row(
          mainAxisAlignment: isResponsive ==true?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
          children: [
           isResponsive ==true? const Text("Book Trip now",style: TextStyle(color: Colors.white),):Container(),
            Image.asset("assets/button-one.png"),
          ],
        ),
    
      ),
    );
  }
}
