import 'package:cowlar_task/database/moviesApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final genreStateProvider =
    ChangeNotifierProvider<GenreStateProvider>((ref) => GenreStateProvider());

class GenreStateProvider extends ChangeNotifier {
  List genres = [];
  void fetchGenres() async {
    genres = await MoviesAPI().getAllGenres();
    notifyListeners();
  }
}
