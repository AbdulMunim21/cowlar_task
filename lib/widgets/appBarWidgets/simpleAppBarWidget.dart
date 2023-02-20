import 'package:cowlar_task/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SimpleAppBarWidget extends StatelessWidget {
  final Function func;
  const SimpleAppBarWidget({super.key, required this.func});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Text(
        "Watch",
        style: TextStyle(color: blackColor, fontSize: 25),
      ),
      InkWell(
        child: const FaIcon(
          FontAwesomeIcons.magnifyingGlass,
        ),
        onTap: () => func(),
      )
    ]);
  }
}
