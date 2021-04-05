import 'package:animation_shop/res/dimens.dart';
import 'package:animation_shop/src/ui/base/base_screen.dart';
import 'package:animation_shop/src/ui/base/basic_screen.dart';
import 'package:animation_shop/src/ui/screen/home/items/last_seen_item.dart';
import 'package:animation_shop/src/ui/screen/home/items/popular_item.dart';
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
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => _getItemAt(index),
              itemCount: 3,
              scrollDirection: Axis.vertical,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getItemAt(int index) {
    switch (index) {
      case 0:
        return _getSearchView();
      case 1:
        return _getLastSeenList();
      default:
        return _getPopularList();
    }
  }

  Widget _getSearchView() {
    TextEditingController _textSearchController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(Dimens.basicMargin),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Dimens.paddingTextField),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(Dimens.textSearchRadius),
            ),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
            )),
        child: TextField(
          controller: _textSearchController,
          textAlign: TextAlign.start,
          textInputAction: TextInputAction.search,
          onSubmitted: (value) {
            print('Search for key word: $value');
          },
          decoration: InputDecoration(
            icon: Icon(Icons.search),
            hintText: 'Search',
          ),
        ),
      ),
    );
  }

  Widget _getLastSeenList() {
    return Container(
      height: Dimens.lastSeenItemHeight,
      child: ListView.separated(
        separatorBuilder: (context, index) =>
            SizedBox(width: Dimens.marginItem),
        itemCount: 5,
        itemBuilder: (context, index) => LastSeenItem(),
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _getPopularList() {
    return Container(
      height: 5 * Dimens.popularItemHeight,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, idnex) => PopularItem(),
        itemCount: 5,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
