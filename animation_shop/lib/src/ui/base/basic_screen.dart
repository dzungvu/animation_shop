import 'package:animation_shop/res/colors.dart';
import 'package:animation_shop/src/ui/base/base_screen.dart';
import 'package:flutter/material.dart';

mixin BasicScreen<Screen extends BaseScreen> on BaseScreenState<Screen> {
  @override
  Widget build(BuildContext context) {
    if (hasAppBar) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            screenName(),
            style: TextStyle(
              color: AppColors.basicAppBarTitle,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: body(),
        ),
      );
    }

    return Scaffold(
      body: Container(
        child: body(),
      ),
    );
  }

  Widget body();
  bool hasAppBar = true;
}
