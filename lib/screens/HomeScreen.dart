import 'package:cowlar_task/constants/colors.dart';
import 'package:cowlar_task/constrants.dart';
import 'package:cowlar_task/providers/screenStateProvider.dart';
import 'package:cowlar_task/widgets/appBarWidgets/appBarWidget.dart';
import 'package:cowlar_task/widgets/navBarWidgets/navBarIconWidget.dart';
import 'package:cowlar_task/widgets/navBarWidgets/navBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SizedBox(
          width: width(context),
          height: height(context) * 0.9,
          child: Column(children: const [
            AppBarWidget(),
          ]),
        ),
        bottomNavigationBar: const NavBarWidget(),
      ),
    );
  }
}
