import 'dart:math';

import 'package:cowlar_task/constants/colors.dart';
import 'package:flutter/material.dart';

class GenreBubbleWidget extends StatelessWidget {
  final genreTitle;
  GenreBubbleWidget({super.key, required this.genreTitle});

  List<dynamic> colorsList = [
    navBarColor,
    neonColor,
    purpleColor,
    pinkColor,
    orangeColor,
    blackColor,
    lightBlueColor,
    appBarColor,
  ];

  var randomIndex = Random().nextInt(8);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 5, right: 7),
      decoration: BoxDecoration(
          color: colorsList[randomIndex],
          borderRadius: BorderRadius.circular(50)),
      child: Text(
        genreTitle,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
