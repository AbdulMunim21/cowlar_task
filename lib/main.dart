import 'package:cowlar_task/blocs/genreListBloc/genreListBloc.dart';
import 'package:cowlar_task/blocs/internetBloc/internetBloc.dart';
import 'package:cowlar_task/blocs/movieListSearchBloc/movieListSearchBloc.dart';
import 'package:cowlar_task/constants/colors.dart';
import 'package:cowlar_task/providers/genreStateProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'blocs/movieListBloc/movieListBloc.dart';
import 'screens/HomeScreen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    ref.read(genreStateProvider.notifier).fetchGenres();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetBloc(),
        ),
        BlocProvider(
          create: (context) => MovieListSearchBloc(),
        ),
        BlocProvider(
          create: (context) => MovieListBloc(),
        ),
        BlocProvider(
          create: (context) => GenreListBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Cowlar Flutter Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Poppins",
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
