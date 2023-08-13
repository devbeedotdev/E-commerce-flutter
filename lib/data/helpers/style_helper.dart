import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styles {
  static TextStyle smallText({Color color = Colors.grey}) {
    return TextStyle(
        fontSize: 12.sp,
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto');
  }

  static TextStyle mediumText({Color color = Colors.black}) {
    return TextStyle(
        fontSize: 22.sp,
        color: color,
        fontWeight: FontWeight.w500,
        fontFamily: 'Roboto');
  }

  static TextStyle largeText() {
    return TextStyle(
        fontSize: 32.sp,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontFamily: 'Roboto');
  }
}
