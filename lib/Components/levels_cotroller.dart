

import 'package:flutter/material.dart';

import '../Services/Sp_Services/cashe_helper.dart';
import 'hexagon_shape.dart';

class LevelsControllerWidget extends StatelessWidget {
  const LevelsControllerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          mainAxisSpacing: 15, // Spacing between rows
          crossAxisSpacing: 8.0, // Spacing between columns
          childAspectRatio: 1.0, // Aspect ratio of each item (width / height)
        ),
        itemCount: 10, // Number of items
        itemBuilder: (BuildContext context, int index) {
          // Builder function to create each item
          return HexagonShape(
            color: Color.fromARGB(255, 60, 91, 249),
            text: (index+1).toString(),
            notopend: true,
            leveNum: index+1,
            previousScore: SharedPreferencesHelper.getData(key: index.toString())?? 0);
        },
      );
    

  }
}