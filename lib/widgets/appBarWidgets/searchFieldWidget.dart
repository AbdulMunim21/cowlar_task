import 'package:cowlar_task/constants/colors.dart';
import 'package:cowlar_task/constrants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchFieldWidget extends StatelessWidget {
  final Function func;
  SearchFieldWidget({super.key, required this.func});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth,
        height: constraints.maxHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: backgroundColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            const FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              color: darkGreyColor,
            ),
            Expanded(
              child: TextFormField(
                controller: controller,
                keyboardType: TextInputType.text,
                cursorColor: blackColor,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 20),
                  hintText: "TV shows, movies and more",
                ),
              ),
            ),
            InkWell(
              onTap: () => func(),
              child: const FaIcon(
                FontAwesomeIcons.circleXmark,
                color: darkGreyColor,
              ),
            ),
          ],
        ),
      );
    });
  }
}
