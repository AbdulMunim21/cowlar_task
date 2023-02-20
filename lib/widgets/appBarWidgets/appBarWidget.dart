import 'package:cowlar_task/constants/colors.dart';
import 'package:cowlar_task/constrants.dart';
import 'package:cowlar_task/widgets/appBarWidgets/searchFieldWidget.dart';
import 'package:cowlar_task/widgets/appBarWidgets/simpleAppBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  bool isSearching = false;
  void changeSearchingFunction() {
    setState(() {
      isSearching = !isSearching;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: width(context),
      height: height(context) * 0.1,
      color: appBarColor,
      alignment: Alignment.center,
      child: isSearching
          ? SearchFieldWidget(func: changeSearchingFunction)
          : SimpleAppBarWidget(func: changeSearchingFunction),
    );
  }
}
