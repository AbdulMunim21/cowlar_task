import 'package:cowlar_task/model/movieModel.dart';
import 'package:drift/drift.dart';
import 'dart:io';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../entities/movieEntity.dart';
part 'movieDatabase.g.dart';

@DriftDatabase(tables: [Movie])
class MovieDatabase extends _$MovieDatabase {
  MovieDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;

  Future<List<MovieModel>> getMovies() async {
    final response = await select(movie).get();
    // print(response);
    List<MovieModel> allMovies = response.map((val) {
      String genreListStr = val.genreIds;
      final listStr = genreListStr.substring(1, genreListStr.length - 1);
      final genreList = listStr.split(",").map((e) => int.parse(e)).toList();
      return MovieModel(
          id: val.id,
          title: val.title,
          hasVideo: val.hasVideo == 0 ? false : true,
          imageUrl: val.imageUrl,
          overview: val.overview,
          releaseDate: val.releaseDate,
          genreIds: genreList);
    }).toList();

    return allMovies;
  }

  Future<int> insertMovie(MovieCompanion movieCompanion) async {
    return await into(movie).insertOnConflictUpdate(movieCompanion);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

final movieDatabase = MovieDatabase();
