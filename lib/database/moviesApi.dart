import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cowlar_task/localdb/movieLocalDatabaseApi.dart';
import 'package:cowlar_task/model/movieModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../constants/keys.dart';

class MoviesAPI {
  final dio = Dio();
  Future<List<MovieModel>> getAllMovies() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      final response = await dio
          .get("https://api.themoviedb.org/3/trending/all/day?api_key=$apiKey");
      // save in local database
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
      // get data from database
      return await MovieLocalDatabaseAPI().getAllMovies();
    }
  }

  getAllGenres() async {
    final response = await dio.get(
        "https://api.themoviedb.org/3/genre/movie/list?api_key=576f015f7065a05f3effe8b630ea2e9c&language=en-US");

    return response.data['genres'];
  }

  getSearchMovie(String query) async {
    final response = await dio.get(
        "https://api.themoviedb.org/3/search/multi?api_key=576f015f7065a05f3effe8b630ea2e9c&language=en-US&query=$query&page=1&include_adult=false");

    final movieList = response.data['results'];
    final filteredMovieList = [];

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

  getMovieTrailerId(int id) async {
    final response = await dio
        .get("https://api.themoviedb.org/3/movie/$id/videos?api_key=$apiKey");

    String videoId = response.data['results'][0]['key'];
    return videoId;
  }
}
