import 'package:flutter/material.dart';

class SpacerUtil<Widget> {
  static hspace(double h) {
    return SizedBox(height: h);
  }

  static wspace(double w) {
    return SizedBox(width: w);
  }

  static bspace(double w, double h) {
    return SizedBox(width: w, height: h);
  }
}
