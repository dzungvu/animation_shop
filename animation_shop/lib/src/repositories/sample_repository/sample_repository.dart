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
          imageUrl: 'lib/res/assets/img1.jpeg',
        ),
      )
      ..add(
        ItemHomeEntity(
          id: GeneralEntity.LINEAR_TEXT,
          title: 'Linear Text',
          des: 'Rotate text with 3d effect',
          imageUrl: 'lib/res/assets/img2.jpeg',
        ),
      )
      ..add(
        ItemHomeEntity(
          id: GeneralEntity.LINEAR_TEXT,
          title: 'Linear Text',
          des: 'Rotate text with 3d effect',
          imageUrl: 'lib/res/assets/img3.jpeg',
        ),
      )
      ..add(
        ItemHomeEntity(
          id: GeneralEntity.LINEAR_TEXT,
          title: 'Linear Text',
          des: 'Rotate text with 3d effect',
          imageUrl: 'lib/res/assets/img4.jpeg',
        ),
      )
      ..add(
        ItemHomeEntity(
          id: GeneralEntity.LINEAR_TEXT,
          title: 'Linear Text',
          des: 'Rotate text with 3d effect',
          imageUrl: 'lib/res/assets/img5.jpeg',
        ),
      )
      ..add(
        ItemHomeEntity(
          id: GeneralEntity.LINEAR_TEXT,
          title: 'Linear Text',
          des: 'Rotate text with 3d effect',
          imageUrl: 'lib/res/assets/img6.jpeg',
        ),
      )
      ..add(
        ItemHomeEntity(
          id: GeneralEntity.LINEAR_TEXT,
          title: 'Linear Text',
          des: 'Rotate text with 3d effect',
          imageUrl: 'lib/res/assets/img7.jpeg',
        ),
      )
      ..add(
        ItemHomeEntity(
          id: GeneralEntity.LINEAR_TEXT,
          title: 'Linear Text',
          des: 'Rotate text with 3d effect',
          imageUrl: 'lib/res/assets/img8.jpeg',
        ),
      )
      ..add(
        ItemHomeEntity(
          id: GeneralEntity.LINEAR_TEXT,
          title: 'Linear Text',
          des: 'Rotate text with 3d effect',
          imageUrl: 'lib/res/assets/img9.jpeg',
        ),
      )
      ..add(
        ItemHomeEntity(
          id: GeneralEntity.LINEAR_TEXT,
          title: 'Linear Text',
          des: 'Rotate text with 3d effect',
          imageUrl: 'lib/res/assets/img10.jpeg',
        ),
      );

    return data;
  }
}
