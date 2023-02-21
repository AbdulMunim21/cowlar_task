import 'package:cowlar_task/constants/colors.dart';
import 'package:cowlar_task/constrants.dart';
import 'package:cowlar_task/widgets/appBarWidgets/searchFieldWidget.dart';
import 'package:cowlar_task/widgets/appBarWidgets/simpleAppBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarWidget extends StatelessWidget {
  final Function changeSearchingFunction;
  final bool isSearching;
  final TextEditingController controller;
  final Function onSubmit;
  const AppBarWidget(
      {super.key,
      required this.changeSearchingFunction,
      required this.isSearching,
      required this.controller,
      required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: width(context),
      color: appBarColor,
      alignment: Alignment.center,
      child: isSearching
          ? SearchFieldWidget(
              func: changeSearchingFunction,
              controller: controller,
              onSubmit: onSubmit,
            )
          : SimpleAppBarWidget(func: changeSearchingFunction),
    );
  }
}
