import 'package:flutter/material.dart';


class Styles {

  static const Color textColor1=  Color(0xFF989acd);
  static const Color textColor2 =  Color(0xFF878593);
  static const Color bigTextColor= Color(0xFF2e2e31);
  static const Color mainColor=  Color(0xFF5d69b3);
  static const Color dotColor=  Color(0xFF3AB4F2);
  static const Color starColor =  Color(0xFFe7bb4e);
  static const Color mainTextColor =  Color(0xFFababad);
  static const Color buttonBackground =  Color(0xfff1f1f9);


  static TextStyle textStyle = const TextStyle(
    fontSize: 16,
    color: textColor1,
    fontWeight: FontWeight.w500,
  );
  static TextStyle headLines = const TextStyle(
    fontSize: 26,
    color: bigTextColor,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headLines2 = const TextStyle(
    fontSize: 22,
    color: textColor1,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headLines3 = const TextStyle(
    fontSize: 18,
    color: textColor2,
    fontWeight: FontWeight.w500,
  );
  static TextStyle headLines4 = TextStyle(
    fontSize: 16,
    color: Colors.grey.shade500,
    fontWeight: FontWeight.w500,
  );
}
