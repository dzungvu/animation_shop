import 'package:flutter/material.dart';

extension ColorschemeExtension on ColorScheme {
  Color get bg =>
      brightness == Brightness.light ? Colors.grey.shade900 : Color(0xFFE7E7EC);

  Color get basicTitleColor =>
      brightness == Brightness.light ? Colors.black : Colors.white;

  Color get mainTitle =>
      brightness == Brightness.light ? Colors.grey.shade700 : Colors.white;

  Color get mainContent =>
      brightness == Brightness.light ? Colors.grey.shade900 : Colors.white;
}
