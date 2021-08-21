import 'package:animation_shop/res/colors.dart';
import 'package:animation_shop/src/ui/base/base_screen.dart';
import 'package:animation_shop/src/ui/base/basic_screen.dart';
import 'package:flutter/material.dart';

class LinearTextScreen extends BaseScreen {
  static final String routeName = '/liear_text_screen';
  @override
  State<StatefulWidget> createState() => LinearTextState();
}

class LinearTextState extends BaseScreenState<LinearTextScreen>
    with BasicScreen {
  @override
  String screenName() => 'Linear Text';

  @override
  Widget body(BuildContext context) {
    return SafeArea(
      child: Center(
        child: RotatedBox(
          quarterTurns: 3,
          child: Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.9),
                  Colors.transparent
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.0, 0.2, 0.8],
              ),
            ),
            child: Text(
              'LINEAR',
              style: TextStyle(
                color: Colors.white,
                fontSize: 110,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
