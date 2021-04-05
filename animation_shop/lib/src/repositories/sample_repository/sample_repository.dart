import 'package:animation_shop/src/entities/home/item_home_entity.dart';

class SampleRepository {
  List<ItemHomeEntity> getHomeData() {
    List<ItemHomeEntity> data = [];
    for (int i = 0; i < 10; i++) {
      data.add(
        ItemHomeEntity(
          title: 'Item number $i',
          des: 'Description for item number $i',
          imageUrl:
              'https://img.etimg.com/thumb/msid-75176755,width-640,resizemode-4,imgsize-612672/effect-of-coronavirus-on-food.jpg',
        ),
      );
    }

    return data;
  }
}
