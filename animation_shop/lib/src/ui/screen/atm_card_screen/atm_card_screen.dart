import 'dart:math';

import 'package:animation_shop/res/colors.dart';
import 'package:animation_shop/src/ui/base/base_screen.dart';
import 'package:animation_shop/src/ui/base/basic_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class AtmCardScreen extends BaseScreen {
  static final routeName = '/atm_card_screen';
  @override
  State<StatefulWidget> createState() => _AtmCardState();
}

class _AtmCardState extends BaseScreenState<AtmCardScreen> with BasicScreen {
  @override
  String screenName() => 'ATM Card';

  @override
  Color get backgroundColor => AppColors.lightThemeBg;

  var x = 0.0;

  @override
  Widget body(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(64),
      child: Center(
        child: Transform(
          transform: Matrix4.identity()..setEntry(3, 2, 0.001)..rotateX(x),
          alignment: FractionalOffset.center,
          child: GestureDetector(
            onPanUpdate: (details) {
              debugPrint('pan gesture ${details.delta.dy}');
              setState(() {
                x = x + details.delta.dy / 100;
              });
            },
            child: Image.asset(
              'lib/res/assets/cardf.png',
            ),
          ),
        ),
      ),
    );
  }
}
