import 'package:flutter/material.dart';
import 'package:page_animation/src/provider/page_view_holder.dart';
import 'package:page_animation/src/ui/views/home_header.dart';
import 'package:page_animation/src/ui/views/home_item.dart';
import 'package:page_animation/src/utils/data_utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  final _fraction = 0.7;
  late final _pageController = PageController(
    initialPage: 2,
    viewportFraction: _fraction,
  );

  final PageViewHolder _holder = PageViewHolder(page: 2.0);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _holder.setPage(_pageController.page ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            HomeHeader(),
            Expanded(
              flex: 1,
              child: ChangeNotifierProvider<PageViewHolder>.value(
                value: _holder,
                child: PageView.builder(
                  controller: _pageController,
                  itemBuilder: (context, index) => HomeItem(
                    index: index.toDouble(),
                    data: DataUtils.getListSubCategory()[index],
                  ),
                  itemCount: DataUtils.getListSubCategory().length,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
