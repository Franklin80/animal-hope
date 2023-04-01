import 'package:flutter/material.dart';

import '../model/DUMMY_DATA.dart';

class AnimalList extends StatelessWidget {
  AnimalList({super.key});

  var animalList = DUMMY_DATA().loadAnimals();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return Card(
          elevation: 6,
          child: Image.asset(
            animalList[index].smallImage,
            fit: BoxFit.cover,
            height: 250,
          ),
        );
      },
      itemCount: animalList.length,
    );
  }
}
