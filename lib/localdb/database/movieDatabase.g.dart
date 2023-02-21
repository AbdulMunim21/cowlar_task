// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movieDatabase.dart';

// ignore_for_file: type=lint
class $MovieTable extends Movie with TableInfo<$MovieTable, MovieData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MovieTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _overviewMeta =
      const VerificationMeta('overview');
  @override
  late final GeneratedColumn<String> overview = GeneratedColumn<String>(
      'overview', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<String> releaseDate = GeneratedColumn<String>(
      'release_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _genreIdsMeta =
      const VerificationMeta('genreIds');
  @override
  late final GeneratedColumn<String> genreIds = GeneratedColumn<String>(
      'genre_ids', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hasVideoMeta =
      const VerificationMeta('hasVideo');
  @override
  late final GeneratedColumn<int> hasVideo = GeneratedColumn<int>(
      'has_video', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, overview, imageUrl, releaseDate, genreIds, hasVideo];
  @override
  String get aliasedName => _alias ?? 'movie';
  @override
  String get actualTableName => 'movie';
  @override
  VerificationContext validateIntegrity(Insertable<MovieData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta));
    } else if (isInserting) {
      context.missing(_overviewMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    } else if (isInserting) {
      context.missing(_releaseDateMeta);
    }
    if (data.containsKey('genre_ids')) {
      context.handle(_genreIdsMeta,
          genreIds.isAcceptableOrUnknown(data['genre_ids']!, _genreIdsMeta));
    } else if (isInserting) {
      context.missing(_genreIdsMeta);
    }
    if (data.containsKey('has_video')) {
      context.handle(_hasVideoMeta,
          hasVideo.isAcceptableOrUnknown(data['has_video']!, _hasVideoMeta));
    } else if (isInserting) {
      context.missing(_hasVideoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MovieData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MovieData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      overview: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}overview'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
      releaseDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}release_date'])!,
      genreIds: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}genre_ids'])!,
      hasVideo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}has_video'])!,
    );
  }

  @override
  $MovieTable createAlias(String alias) {
    return $MovieTable(attachedDatabase, alias);
  }
}

class MovieData extends DataClass implements Insertable<MovieData> {
  final int id;
  final String title;
  final String overview;
  final String imageUrl;
  final String releaseDate;
  final String genreIds;
  final int hasVideo;
  const MovieData(
      {required this.id,
      required this.title,
      required this.overview,
      required this.imageUrl,
      required this.releaseDate,
      required this.genreIds,
      required this.hasVideo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['overview'] = Variable<String>(overview);
    map['image_url'] = Variable<String>(imageUrl);
    map['release_date'] = Variable<String>(releaseDate);
    map['genre_ids'] = Variable<String>(genreIds);
    map['has_video'] = Variable<int>(hasVideo);
    return map;
  }

  MovieCompanion toCompanion(bool nullToAbsent) {
    return MovieCompanion(
      id: Value(id),
      title: Value(title),
      overview: Value(overview),
      imageUrl: Value(imageUrl),
      releaseDate: Value(releaseDate),
      genreIds: Value(genreIds),
      hasVideo: Value(hasVideo),
    );
  }

  factory MovieData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MovieData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      overview: serializer.fromJson<String>(json['overview']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      releaseDate: serializer.fromJson<String>(json['releaseDate']),
      genreIds: serializer.fromJson<String>(json['genreIds']),
      hasVideo: serializer.fromJson<int>(json['hasVideo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'overview': serializer.toJson<String>(overview),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'releaseDate': serializer.toJson<String>(releaseDate),
      'genreIds': serializer.toJson<String>(genreIds),
      'hasVideo': serializer.toJson<int>(hasVideo),
    };
  }

  MovieData copyWith(
          {int? id,
          String? title,
          String? overview,
          String? imageUrl,
          String? releaseDate,
          String? genreIds,
          int? hasVideo}) =>
      MovieData(
        id: id ?? this.id,
        title: title ?? this.title,
        overview: overview ?? this.overview,
        imageUrl: imageUrl ?? this.imageUrl,
        releaseDate: releaseDate ?? this.releaseDate,
        genreIds: genreIds ?? this.genreIds,
        hasVideo: hasVideo ?? this.hasVideo,
      );
  @override
  String toString() {
    return (StringBuffer('MovieData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('overview: $overview, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('genreIds: $genreIds, ')
          ..write('hasVideo: $hasVideo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, overview, imageUrl, releaseDate, genreIds, hasVideo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovieData &&
          other.id == this.id &&
          other.title == this.title &&
          other.overview == this.overview &&
          other.imageUrl == this.imageUrl &&
          other.releaseDate == this.releaseDate &&
          other.genreIds == this.genreIds &&
          other.hasVideo == this.hasVideo);
}

class MovieCompanion extends UpdateCompanion<MovieData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> overview;
  final Value<String> imageUrl;
  final Value<String> releaseDate;
  final Value<String> genreIds;
  final Value<int> hasVideo;
  const MovieCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.overview = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.genreIds = const Value.absent(),
    this.hasVideo = const Value.absent(),
  });
  MovieCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String overview,
    required String imageUrl,
    required String releaseDate,
    required String genreIds,
    required int hasVideo,
  })  : title = Value(title),
        overview = Value(overview),
        imageUrl = Value(imageUrl),
        releaseDate = Value(releaseDate),
        genreIds = Value(genreIds),
        hasVideo = Value(hasVideo);
  static Insertable<MovieData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? overview,
    Expression<String>? imageUrl,
    Expression<String>? releaseDate,
    Expression<String>? genreIds,
    Expression<int>? hasVideo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (overview != null) 'overview': overview,
      if (imageUrl != null) 'image_url': imageUrl,
      if (releaseDate != null) 'release_date': releaseDate,
      if (genreIds != null) 'genre_ids': genreIds,
      if (hasVideo != null) 'has_video': hasVideo,
    });
  }

  MovieCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? overview,
      Value<String>? imageUrl,
      Value<String>? releaseDate,
      Value<String>? genreIds,
      Value<int>? hasVideo}) {
    return MovieCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      imageUrl: imageUrl ?? this.imageUrl,
      releaseDate: releaseDate ?? this.releaseDate,
      genreIds: genreIds ?? this.genreIds,
      hasVideo: hasVideo ?? this.hasVideo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<String>(releaseDate.value);
    }
    if (genreIds.present) {
      map['genre_ids'] = Variable<String>(genreIds.value);
    }
    if (hasVideo.present) {
      map['has_video'] = Variable<int>(hasVideo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MovieCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('overview: $overview, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('genreIds: $genreIds, ')
          ..write('hasVideo: $hasVideo')
          ..write(')'))
        .toString();
  }
}

abstract class _$MovieDatabase extends GeneratedDatabase {
  _$MovieDatabase(QueryExecutor e) : super(e);
  late final $MovieTable movie = $MovieTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [movie];
}
