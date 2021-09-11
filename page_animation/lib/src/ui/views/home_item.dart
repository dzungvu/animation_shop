import 'dart:math';

import 'package:flutter/material.dart';
import 'package:page_animation/src/models/home_item_entity.dart';
import 'package:page_animation/src/provider/page_view_holder.dart';
import 'package:provider/provider.dart';

class HomeItem extends StatelessWidget {
  final double index;
  final HomeItemEntity data;
  const HomeItem({required this.index, required this.data});
  @override
  Widget build(BuildContext context) {
    double page = Provider.of<PageViewHolder>(context).page;
    double diff = index - page;
    double scaleValue = 1 + diff.abs() * 0.1;

    double gauss = exp(-(pow((diff.abs() - 0.5), 2) / 0.08));
    double distance = 32;

    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 3, scaleValue)
        ..setEntry(0, 3, distance * gauss * diff.sign),
      alignment: FractionalOffset.center,
      child: Card(
        elevation: 8,
        margin: EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(32)),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  data.imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.black.withAlpha(150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: Offset(distance * diff, 0),
                    child: Text(
                      data.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 50,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(distance * diff, 0),
                    child: Text(
                      data.desc,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 15.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Container(
                    height: 40.0,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          19.0,
                        ),
                      ),
                      color: Colors.black,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'View Detail',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
