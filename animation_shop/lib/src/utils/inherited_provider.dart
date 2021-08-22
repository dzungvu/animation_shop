import 'package:flutter/material.dart';

class MyInheritedProvider<T> extends InheritedWidget {
  final T? inheritedData;

  MyInheritedProvider({required Widget child, this.inheritedData})
      : super(child: child);

  @override
  bool updateShouldNotify(MyInheritedProvider oldWidget) {
    return inheritedData != oldWidget.inheritedData;
  }

  static T? of<T>(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<MyInheritedProvider<T>>()
      ?.inheritedData;
}
