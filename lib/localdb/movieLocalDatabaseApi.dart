import 'movieDatabase.dart';

class MovieLocalDatabaseAPI {
  Future<List<MovieData>> getAllMovies() async {
    return await movieDatabase.select(movieDatabase.movie).get();
  }

  Future<void> addMoviesToDatabase(movieList) async {
    for (var movie in movieList) {
      print("Addeing");
      await movieDatabase.into(movieDatabase.movie).insertOnConflictUpdate(
          MovieCompanion.insert(
              id: movie['id'],
              title: movie['title'],
              overview: movie['overview'],
              imageUrl: movie['poster_path'],
              releaseDate: movie['release_date'],
              genreIds: movie['genre_ids'],
              hasVideo: movie['video'] ? 1 : 0));
    }
    print("Added");
  }
}
