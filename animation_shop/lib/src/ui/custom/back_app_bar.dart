import 'package:animation_shop/res/colors.dart';
import 'package:animation_shop/res/dimens.dart';
import 'package:flutter/material.dart';

class AppBarContent extends StatelessWidget implements PreferredSizeWidget {
  final String titile;
  final Function onBackPress;

  AppBarContent({
    Key key,
    @required this.titile,
    @required this.onBackPress,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(Dimens.basicMargin),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
              iconSize: Dimens.basicIconSize,
              color: AppColors.basicIconColor,
            ),
          ),
          Container(
            child: Text(
              titile,
              style: TextStyle(
                color: AppColors.basicIconColor,
                fontWeight: FontWeight.bold,
                fontSize: Dimens.basicAppBarTitleSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
