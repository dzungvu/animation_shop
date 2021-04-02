import 'package:animation_shop/src/ui/base/base_screen.dart';
import 'package:animation_shop/src/ui/base/basic_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends BaseScreen {
  static final String routeName = '/home';
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseScreenState<HomeScreen> with BasicScreen {
  @override
  String screenName() => "Animation Shop";

  @override
  Widget body() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          print("Button click");
        },
        child: Text("Home Button"),
      ),
    );
  }
}
