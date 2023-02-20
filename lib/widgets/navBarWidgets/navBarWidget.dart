import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/colors.dart';
import '../../constrants.dart';
import '../../providers/screenStateProvider.dart';
import 'navBarIconWidget.dart';

class NavBarWidget extends ConsumerWidget {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final screenIndex = ref.watch(screenStateProvider).screenIndex;
    changeScreenFunction(int index) {
      ref.read(screenStateProvider.notifier).changeIndex(index);
    }

    return Container(
      width: width(context),
      height: height(context) * 0.1,
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        color: navBarColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        NavBarIconWidget(
          icon: FontAwesomeIcons.dashcube,
          title: "Dashboard",
          isFocused: screenIndex == 0,
          func: changeScreenFunction,
          index: 0,
        ),
        NavBarIconWidget(
          icon: FontAwesomeIcons.youtube,
          title: "Watch",
          isFocused: screenIndex == 1,
          func: changeScreenFunction,
          index: 1,
        ),
        NavBarIconWidget(
          icon: FontAwesomeIcons.folder,
          title: "Media Library",
          isFocused: screenIndex == 2,
          func: changeScreenFunction,
          index: 2,
        ),
        NavBarIconWidget(
          icon: FontAwesomeIcons.bars,
          title: "More",
          isFocused: screenIndex == 3,
          func: changeScreenFunction,
          index: 3,
        ),
      ]),
    );
  }
}
