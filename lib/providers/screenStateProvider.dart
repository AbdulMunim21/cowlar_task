import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final screenStateProvider =
    ChangeNotifierProvider<ScreenStateProvider>((ref) => ScreenStateProvider());

class ScreenStateProvider extends ChangeNotifier {
  int screenIndex = 1;
  void changeIndex(int index) {
    screenIndex = index;
    notifyListeners();
  }
}
