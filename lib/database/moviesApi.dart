import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cowlar_task/localdb/movieLocalDatabaseApi.dart';
import 'package:cowlar_task/model/movieModel.dart';
import 'package:dio/dio.dart';

import '../constants/keys.dart';

class MoviesAPI {
  final dio = Dio();
  Future<List<MovieModel>> getAllMovies() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      final response =
          await dio.get("$baseUrl/trending/all/day?api_key=$apiKey");
      final movieList = response.data['results'];
      List<MovieModel> filteredMovieList = [];
      for (var movie in movieList) {
        if (movie["title"] != null) {
          filteredMovieList.add(
            MovieModel(
              id: movie['id'],
              title: movie['title'],
              hasVideo: movie['video'],
              imageUrl: movie['poster_path'],
              overview: movie['overview'],
              releaseDate: movie['release_date'],
              genreIds: movie['genre_ids'],
            ),
          );
        }
      }
      await MovieLocalDatabaseAPI().addMoviesToDatabase(filteredMovieList);
      return filteredMovieList;
    } else {
      return await MovieLocalDatabaseAPI().getAllMovies();
    }
  }

  Future<List<dynamic>> getAllGenres() async {
    final response = await dio
        .get("$baseUrl/genre/movie/list?api_key=$apiKey&language=en-US");
    // print(response.data['genres'].runtimeType);
    return response.data['genres'];
  }

  Future<List<MovieModel>> getSearchMovie(String query) async {
    final response = await dio.get(
        "$baseUrl/search/multi?api_key=$apiKey&language=en-US&query=$query&page=1&include_adult=false");

    final movieList = response.data['results'];
    final List<MovieModel> filteredMovieList = [];

    for (var movie in movieList) {
      if (movie["title"] != null) {
        filteredMovieList.add(
          MovieModel(
            id: movie['id'],
            title: movie['title'],
            hasVideo: movie['video'] ?? false,
            imageUrl: movie['poster_path'] ?? "",
            overview: movie['overview'] ?? "",
            releaseDate: movie['release_date'] ?? "",
            genreIds: movie['genre_ids'] ?? [],
          ),
        );
      }
    }
    // print(filteredMovieList);
    return filteredMovieList;
  }

  Future<String> getMovieTrailerId(int id) async {
    final response = await dio.get("$baseUrl/movie/$id/videos?api_key=$apiKey");

    String videoId = response.data['results'][0]['key'];
    return videoId;
  }
}
