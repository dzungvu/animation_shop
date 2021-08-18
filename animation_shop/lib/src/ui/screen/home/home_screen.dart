import 'package:animation_shop/res/dimens.dart';
import 'package:animation_shop/src/entities/home/item_home_entity.dart';
import 'package:animation_shop/src/ui/base/base_screen.dart';
import 'package:animation_shop/src/ui/base/basic_screen.dart';
import 'package:animation_shop/src/ui/screen/home/home_screen_viewmodel.dart';
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

  HomeViewModel _viewModel = HomeViewModel();

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
        return SearchView();
      case 1:
        return LastSeenList(data: _viewModel.getHomeData());
      default:
        return PopularList();
    }
  }
}

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: 'Search',
          ),
        ),
      ),
    );
  }
}

class LastSeenList extends StatelessWidget {
  final List<ItemHomeEntity> data;

  LastSeenList({@required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.lastSeenItemHeight,
      child: ListView.separated(
        separatorBuilder: (context, index) =>
            SizedBox(width: Dimens.marginItem),
        itemCount: data.length,
        itemBuilder: (context, index) => LastSeenItem(
          index: index,
          lastIndex: data.length - 1,
          itemHomeEntity: data[index],
        ),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class PopularList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
