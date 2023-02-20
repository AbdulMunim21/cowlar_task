import 'package:cowlar_task/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavBarIconWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isFocused;
  final Function func;
  final int index;
  const NavBarIconWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.isFocused,
      required this.func,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          func(index);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FaIcon(
              icon,
              color: isFocused ? backgroundColor : darkGreyColor,
            ),
            Flexible(
              child: Text(
                title,
                style: TextStyle(
                    color: isFocused ? backgroundColor : darkGreyColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
