import './animal.dart';

// ignore: camel_case_types
class DUMMY_DATA {
  List<Animal> loadAnimals() {
    var animalList = [
      Animal('1', smallImage: 'assets/images/cats/cat_1_small.jpg'),
      Animal('2', smallImage: 'assets/images/cats/cat_2_small.jpg'),
      Animal('3', smallImage: 'assets/images/cats/cat_3_small.jpg'),
      Animal('4', smallImage: 'assets/images/cats/cat_4_small.jpg'),
      Animal('5', smallImage: 'assets/images/cats/cat_5_small.jpg'),
      Animal('6', smallImage: 'assets/images/cats/cat_6_small.jpg'),
      Animal('7', smallImage: 'assets/images/cats/cat_7_small.jpg'),
      Animal('8', smallImage: 'assets/images/cats/cat_8_small.jpg'),
      Animal('9', smallImage: 'assets/images/cats/cat_9_small.jpg'),
      Animal('10', smallImage: 'assets/images/cats/cat_10_small.jpg'),
    ];

    return animalList;
  }
}
