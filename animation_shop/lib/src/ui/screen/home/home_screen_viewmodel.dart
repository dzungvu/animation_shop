import 'package:animation_shop/src/entities/home/item_home_entity.dart';
import 'package:animation_shop/src/repositories/sample_repository/sample_repository.dart';

class HomeViewModel {
  SampleRepository _sampleRepository = SampleRepository();

  List<ItemHomeEntity> getHomeData() {
    print('HomeViewModel call getHomeData');
    return _sampleRepository.getHomeData();
  }
}
