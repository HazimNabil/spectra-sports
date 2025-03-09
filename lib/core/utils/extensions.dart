import 'package:flutter/material.dart';

extension MediaQueryHelper on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
}
