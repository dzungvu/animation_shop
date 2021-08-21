import 'package:animation_shop/res/colors.dart';
import 'package:animation_shop/src/ui/base/base_screen.dart';
import 'package:flutter/material.dart';

mixin BasicScreen<Screen extends BaseScreen> on BaseScreenState<Screen> {
  @override
  Widget build(BuildContext context) {
    if (hasAppBar) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          title: Text(
            screenName(),
            style: TextStyle(
              color: AppColors.basicAppBarTitle,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: body(context),
        ),
      );
    }

    return Scaffold(
      body: Container(
        child: body(context),
      ),
    );
  }

  Widget body(BuildContext context);
  bool hasAppBar = true;
  Color backgroundColor = AppColors.darkThemeBg;
}
