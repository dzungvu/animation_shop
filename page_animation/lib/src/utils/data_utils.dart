import 'package:page_animation/src/models/home_item_entity.dart';

class DataUtils {
  static List<HomeItemEntity> getListSubCategory() {
    return <HomeItemEntity>[]
      ..add(HomeItemEntity(
          id: 'id1',
          imageUrl:
              'https://files.liveworksheets.com/def_files/2020/11/10/1110041342319951/1110041342319951001.jpg',
          title: 'Area and perimeter',
          desc: 'Calculation of area and perimeter of plane geometry'))
      ..add(HomeItemEntity(
          id: 'id2',
          imageUrl:
              'https://www.wikihow.com/images/thumb/0/02/Prove-the-Pythagorean-Theorem-Step-10.jpg/aid595842-v4-1200px-Prove-the-Pythagorean-Theorem-Step-10.jpg',
          title: 'Pythagorean theorem',
          desc: 'The Pythagorean formula is 𝑎2+𝑏2=𝑐2'))
      ..add(HomeItemEntity(
          id: 'id3',
          imageUrl:
              'https://useruploads.socratic.org/kvfcO8n7SMiGtoXowatm_unit%20circle.png',
          title: 'Trigonometric Functions',
          desc:
              'The online trigonometric function worksheet helps to quickly and accurately calculate problems about trigonometric functions'))
      ..add(HomeItemEntity(
          id: 'id4',
          imageUrl:
              'https://i2.wp.com/mathoriginal.com/wp-content/uploads/2020/08/f-img-first.jpg',
          title: 'Equation',
          desc:
              'In mathematics, an equation is a statement that asserts the equality of two expressions. Equations in other languages can have many different meanings.'))
      ..add(HomeItemEntity(
          id: 'id5',
          imageUrl:
              'http://congthuc.edu.vn/wp-content/uploads/2016/01/12390903_681275152009249_1526404831883753709_n1.jpg',
          title: 'Logarit',
          desc:
              'Logarithmic concept: for two positive numbers a, b with a ≠ 1. The number α satisfying the equality 𝑎α=𝑏 is called the logarithm of base a of b and is denoted 𝑙𝑜𝑔𝑎𝑏'))
      ..add(HomeItemEntity(
          id: 'id6',
          imageUrl:
              'https://www.irishtimes.com/polopoly_fs/1.4218941.1585826303!/image/image.jpg_gen/derivatives/ratio_4x3_w1200/image.jpg',
          title: 'Exponential',
          desc:
              'Power is a mathematical operation, written in the form 𝑎𝑛, consisting of two numbers, a being the base and n being the exponent or power, and pronounced “a to a power of n.”'));
  }
}
