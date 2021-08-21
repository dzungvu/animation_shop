import 'package:flutter/material.dart';

class InheritedProvider<T> extends InheritedWidget {
  final T? inheritedData;

  InheritedProvider({required Widget child, this.inheritedData})
      : super(child: child);

  @override
  bool updateShouldNotify(InheritedProvider oldWidget) {
    return inheritedData != oldWidget.inheritedData;
  }

  static T? of<T>(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<InheritedProvider<T>>()
      ?.inheritedData;
}
