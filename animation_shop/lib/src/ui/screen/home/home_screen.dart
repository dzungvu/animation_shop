import 'package:animation_shop/res/dimens.dart';
import 'package:animation_shop/src/entities/genneral/general_entity.dart';
import 'package:animation_shop/src/entities/home/item_home_entity.dart';
import 'package:animation_shop/src/ui/base/base_screen.dart';
import 'package:animation_shop/src/ui/base/basic_screen.dart';
import 'package:animation_shop/src/ui/screen/atm_card_screen/atm_card_screen.dart';
import 'package:animation_shop/src/ui/screen/home/home_screen_viewmodel.dart';
import 'package:animation_shop/src/ui/screen/home/items/last_seen_item.dart';
import 'package:animation_shop/src/ui/screen/home/items/popular_item.dart';
import 'package:animation_shop/src/ui/screen/home/provider/page_view_holder.dart';
import 'package:animation_shop/src/ui/screen/linear_text_screen/linear_text_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animation_shop/extensions/color_scheme_extension.dart';
import 'package:provider/provider.dart';
import 'package:animation_shop/src/utils/inherited_provider.dart';

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
  Widget body(BuildContext context) {
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
            child: MyInheritedProvider<HomeViewModel>(
              inheritedData: _viewModel,
              child: ListMainItem(),
            ),
          ),
        ],
      ),
    );
  }
}

class ListMainItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = MyInheritedProvider.of<HomeViewModel>(context);

    if (viewModel != null) {
      return ListView.builder(
        itemBuilder: (context, index) => MainItem(
          index: index,
          viewModel: viewModel,
        ),
        itemCount: 3,
        scrollDirection: Axis.vertical,
      );
    }
    return Container(
      child: Text('_viewModel null'),
    );
  }
}

class MainItem extends StatelessWidget {
  final int index;
  final HomeViewModel viewModel;
  MainItem({required this.index, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return SearchView();
      case 1:
        return LastSeenList(data: viewModel.getHomeData());

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

  LastSeenList({required this.data});

  final _fraction = 0.5;
  late final _pageController = PageController(
    initialPage: 2,
    viewportFraction: _fraction,
  );
  late final PageViewHolder _holder = PageViewHolder(value: 2.0);

  @override
  Widget build(BuildContext context) {
    debugPrint('Init pagerController');
    _pageController.addListener(() {
      _holder.setValue(_pageController.page ?? 0);
    });
    return Container(
      height: Dimens.lastSeenItemHeight,
      child: AspectRatio(
        aspectRatio: 1,
        child: ChangeNotifierProvider<PageViewHolder>.value(
          value: _holder,
          child: PageView.builder(
            controller: _pageController,
            itemCount: data.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ItemLastSeen(
                data: data[index],
                number: index.toDouble(),
                fraction: _fraction,
              );
            },
          ),
        ),
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

class ItemLastSeen extends StatelessWidget {
  final ItemHomeEntity data;
  final double number;
  final double fraction;

  ItemLastSeen(
      {required this.data, required this.number, required this.fraction});
  @override
  Widget build(BuildContext context) {
    double value = Provider.of<PageViewHolder>(context).value;

    double diff = number - value;

    final Matrix4 pvMatrix = Matrix4.identity()
      ..setEntry(3, 3, 1 / 0.9)
      ..setEntry(1, 1, fraction)
      ..setEntry(3, 0, 0.004 * -diff);

    final Matrix4 shadowMatrix = Matrix4.identity()
      ..setEntry(3, 3, 1 / 1.6)
      ..setEntry(3, 1, -0.004)
      ..setEntry(3, 0, 0.002 * diff)
      ..rotateX(1.309);

    debugPrint('$value');

    return GestureDetector(
      onTap: () => _gotoScreen(context, data.id),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          if (diff <= 1.0 && diff >= -1.0) ...[
            AnimatedOpacity(
              duration: Duration(milliseconds: 100),
              opacity: 1 - diff.abs(),
              child: Transform(
                transform: shadowMatrix,
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
          Transform(
            transform: pvMatrix,
            alignment: FractionalOffset.center,
            child: Container(
              child: Image.asset(
                data.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _gotoScreen(BuildContext context, String id) {
    switch (id) {
      case GeneralEntity.LINEAR_TEXT:
        {
          Navigator.pushNamed(context, LinearTextScreen.routeName);
          break;
        }

      case GeneralEntity.ATM_CARD:
        {
          Navigator.pushNamed(context, AtmCardScreen.routeName);
          break;
        }

      default:
        {}
    }
  }
}
