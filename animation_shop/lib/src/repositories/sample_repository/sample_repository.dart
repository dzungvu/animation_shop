import 'package:animation_shop/src/entities/genneral/general_entity.dart';
import 'package:animation_shop/src/entities/home/item_home_entity.dart';

class SampleRepository {
  List<ItemHomeEntity> getHomeData() {
    List<ItemHomeEntity> data = [];
    data
      ..add(
        ItemHomeEntity(
          id: GeneralEntity.LINEAR_TEXT,
          title: 'Linear Text',
          des: 'Rotate text with 3d effect',
          imageUrl:
              'https://img.etimg.com/thumb/msid-75176755,width-640,resizemode-4,imgsize-612672/effect-of-coronavirus-on-food.jpg',
        ),
      );

    return data;
  }
}
