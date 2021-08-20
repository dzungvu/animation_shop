import 'package:flutter/cupertino.dart';

abstract class BaseScreen extends StatefulWidget {
  BaseScreen({Key? key}) : super(key: key);

  void showLoading() {
    print("show loading function");
  }
}

abstract class BaseScreenState<Screen extends BaseScreen>
    extends State<Screen> {
  String screenName();
}
