import 'package:drift/drift.dart';

class Movie extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get overview => text()();
  TextColumn get imageUrl => text()();
  TextColumn get releaseDate => text()();
  TextColumn get genreIds => text()();
  IntColumn get hasVideo => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
