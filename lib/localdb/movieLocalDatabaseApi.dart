import 'package:cowlar_task/model/movieModel.dart';
import 'package:drift/drift.dart';

import 'database/movieDatabase.dart';
import 'package:drift/drift.dart' as drift;

class MovieLocalDatabaseAPI {
  Future<List<MovieModel>> getAllMovies() async {
    return await movieDatabase.getMovies();
  }

  Future<void> addMoviesToDatabase(movieList) async {
    for (MovieModel movie in movieList) {
      final entity = MovieCompanion(
        id: drift.Value(movie.id),
        title: drift.Value(movie.title),
        overview: drift.Value(movie.overview),
        imageUrl: drift.Value(movie.imageUrl),
        releaseDate: drift.Value(movie.releaseDate),
        genreIds: drift.Value(movie.genreIds.toString()),
        hasVideo: drift.Value(movie.hasVideo ? 1 : 0),
      );

      movieDatabase.insertMovie(entity);

      // print("Addeing");
    }
    // print("Added");
  }
}
