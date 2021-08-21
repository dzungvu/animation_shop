import 'dart:math';

import 'package:animation_shop/src/ui/base/base_screen.dart';
import 'package:animation_shop/src/ui/base/basic_screen.dart';
import 'package:flutter/material.dart';

class LinearTextScreen extends BaseScreen {
  static final String routeName = '/liear_text_screen';
  @override
  State<StatefulWidget> createState() => LinearTextState();
}

class LinearTextState extends BaseScreenState<LinearTextScreen>
    with BasicScreen, SingleTickerProviderStateMixin {
  @override
  String screenName() => 'Linear Text';

  bool isOnLeft(double rotation) => cos(rotation) > 0;

  late AnimationController _animationController =
      AnimationController(vsync: this, duration: Duration(seconds: 2))
        ..repeat();

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget body(BuildContext context) {
    final numberOfTexts = 20;

    return SafeArea(
      child: Center(
        child: Stack(
          children: List.generate(
            numberOfTexts,
            (index) {
              return AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  final animationRotationValue = _animationController.value *
                      2 *
                      pi /
                      numberOfTexts; //<-- calculate animation rotation value
                  double rotation = 2 * pi * index / numberOfTexts +
                      pi / 2 +
                      animationRotationValue; //<-- add the animation value
                  if (isOnLeft(rotation)) {
                    rotation = -rotation +
                        2 * animationRotationValue - //<-- adjust the formula on the left side
                        pi * 2 / numberOfTexts;
                  }
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2,
                          0.001) //<--add perspective to the transformation
                      ..rotateY(rotation)
                      ..translate(-120.0),
                    child: LinearText(),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class LinearText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
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
    );
  }
}
