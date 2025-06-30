import 'package:flutter/material.dart';

extension MediaQueryHelper on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
  double get heightScaleFactor => height / 812;
  double get widthScaleFactor => width / 375;
  double get keyboardHeight => MediaQuery.viewInsetsOf(this).bottom;
}
