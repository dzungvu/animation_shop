import 'package:animation_shop/src/ui/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:animation_shop/extensions/color_scheme_extension.dart';

mixin BasicScreen<Screen extends BaseScreen> on BaseScreenState<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            screenName(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.basicTitleColor,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: body(),
        ));
  }

  Widget body();
}
