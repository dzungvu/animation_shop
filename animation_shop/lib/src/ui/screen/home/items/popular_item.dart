import 'package:animation_shop/res/dimens.dart';
import 'package:flutter/cupertino.dart';

class PopularItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.popularItemHeight,
      width: Dimens.popularItemWidth,
      child: Center(
        child: Text('Popular item'),
      ),
    );
  }
}
