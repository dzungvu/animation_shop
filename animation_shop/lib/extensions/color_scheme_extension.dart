import 'package:flutter/material.dart';

extension ColorschemeExtension on ColorScheme {
  Color get bg =>
      brightness == Brightness.light ? Colors.grey.shade900 : Color(0xFFE7E7EC);

  Color get basicTitleColor =>
      brightness == Brightness.light ? Colors.black : Colors.white;
}
