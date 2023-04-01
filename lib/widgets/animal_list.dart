import 'package:animal_hope/model/species.dart';
import 'package:flutter/material.dart';

import '../model/DUMMY_DATA.dart';

class AnimalList extends StatefulWidget {
  AnimalList({super.key});

  @override
  State<AnimalList> createState() => _AnimalListState();
}

class _AnimalListState extends State<AnimalList> {
  var animalList = DUMMY_DATA().loadAnimals();

  ButtonStyle getFilterButtonStyle(ctx) {
    return OutlinedButton.styleFrom(
      shape: BeveledRectangleBorder(),
      side: BorderSide(
        width: 0.5,
        color: Theme.of(ctx).primaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 3,
          ),
          height: 50,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 6,
                  ),
                  child: OutlinedButton(
                    style: getFilterButtonStyle(context),
                    onPressed: () {
                      setState(() {
                        animalList = DUMMY_DATA().loadAnimals();
                      });
                    },
                    child: const Text('Alle'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 6,
                  ),
                  child: OutlinedButton(
                    style: getFilterButtonStyle(context),
                    onPressed: () {
                      setState(() {
                        animalList =
                            DUMMY_DATA().getAnimalsBySpecies(Species.Cat);
                      });
                    },
                    child: const Text('Katzen'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 6,
                  ),
                  child: OutlinedButton(
                    style: getFilterButtonStyle(context),
                    onPressed: () {
                      setState(() {
                        animalList =
                            DUMMY_DATA().getAnimalsBySpecies(Species.Dog);
                      });
                    },
                    child: const Text('Hunde'),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
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
          ),
        ),
      ],
    );
  }
}
