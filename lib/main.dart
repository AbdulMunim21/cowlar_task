import 'package:cowlar_task/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/HomeScreen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cowlar Flutter Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
      home: const HomeScreen(),
    );
  }
}
