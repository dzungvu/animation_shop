import 'package:animation_shop/res/dimens.dart';
import 'package:animation_shop/src/ui/base/base_screen.dart';
import 'package:animation_shop/src/ui/base/basic_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animation_shop/extensions/color_scheme_extension.dart';

class HomeScreen extends BaseScreen {
  static final String routeName = '/home';
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseScreenState<HomeScreen> with BasicScreen {
  @override
  String screenName() => "Animation Shop";

  @override
  bool get hasAppBar => false;

  @override
  Widget body() {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(
              Dimens.basicMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.mainTitle,
                          fontSize: Dimens.largeTitle,
                        ),
                      ),
                      Text(
                        'Makael',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.mainContent,
                          fontSize: Dimens.largeContent,
                        ),
                      )
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    print('Click on profile icon');
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
