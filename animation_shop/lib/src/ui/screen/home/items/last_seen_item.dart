import 'package:animation_shop/res/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LastSeenItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber,
        border: Border.all(
          color: Colors.black,
        ),
      ),
      width: Dimens.lastSeenItemWidth,
      height: Dimens.lastSeenItemHeight,
      child: Center(
        child: Text('Last seen item'),
      ),
    );
  }
}
