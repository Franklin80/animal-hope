
import 'package:flutter/foundation.dart';

import './species.dart';

class Animal {
  final String id;
  final Species species;

  final String name;
  final String description;
  final String breed;

  final String smallImage;
  final String bigImage;

  Animal(
    this.id, {
    this.species = Species.Dog,
    this.name = "",
    this.description = "",
    this.breed = "",
    this.smallImage = "",
    this.bigImage = "",
  });
}
