import 'package:animation_shop/res/dimens.dart';
import 'package:animation_shop/src/entities/home/item_home_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LastSeenItem extends StatelessWidget {
  final int index;
  final int lastIndex;
  final ItemHomeEntity itemHomeEntity;

  LastSeenItem({
    Key key,
    this.index,
    this.lastIndex,
    this.itemHomeEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('index: $index');
    double _itemPaddingLeft = index == 0 ? Dimens.basicMargin : 0;
    double _itemPaddingRight = index == lastIndex ? Dimens.basicMargin : 0;

    return Padding(
      padding: EdgeInsets.only(
        left: _itemPaddingLeft,
        right: _itemPaddingRight,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          border: Border.all(
            color: Colors.black,
          ),
        ),
        width: Dimens.lastSeenItemWidth,
        height: Dimens.lastSeenItemHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(itemHomeEntity.title),
            Text(itemHomeEntity.des),
            Image(image: NetworkImage(itemHomeEntity.imageUrl)),
          ],
        ),
      ),
    );
  }
}
