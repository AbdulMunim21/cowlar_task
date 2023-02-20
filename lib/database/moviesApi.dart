import 'package:dio/dio.dart';

class MoviesAPI {
  final dio = Dio();
  getAllMovies() async {
    final response = await dio.get(
        "https://api.themoviedb.org/3/trending/all/day?api_key=576f015f7065a05f3effe8b630ea2e9c");

    // save in local database

    // store in provider
  }
}
