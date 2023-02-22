import 'dart:convert';

import 'package:flutter/foundation.dart';

class MovieModel {
  final int id;
  final String title;
  final bool hasVideo;
  final String imageUrl;
  final String overview;
  final String releaseDate;
  final List genreIds;

  MovieModel({
    required this.id,
    required this.title,
    required this.hasVideo,
    required this.imageUrl,
    required this.overview,
    required this.releaseDate,
    required this.genreIds,
  });

  

  MovieModel copyWith({
    int? id,
    String? title,
    bool? hasVideo,
    String? imageUrl,
    String? overview,
    String? releaseDate,
    List? genreIds,
  }) {
    return MovieModel(
      id: id ?? this.id,
      title: title ?? this.title,
      hasVideo: hasVideo ?? this.hasVideo,
      imageUrl: imageUrl ?? this.imageUrl,
      overview: overview ?? this.overview,
      releaseDate: releaseDate ?? this.releaseDate,
      genreIds: genreIds ?? this.genreIds,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'hasVideo': hasVideo,
      'imageUrl': imageUrl,
      'overview': overview,
      'releaseDate': releaseDate,
      'genreIds': genreIds,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      hasVideo: map['hasVideo'] ?? false,
      imageUrl: map['imageUrl'] ?? '',
      overview: map['overview'] ?? '',
      releaseDate: map['releaseDate'] ?? '',
      genreIds: List.from(map['genreIds']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) => MovieModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MovieModel(id: $id, title: $title, hasVideo: $hasVideo, imageUrl: $imageUrl, overview: $overview, releaseDate: $releaseDate, genreIds: $genreIds)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MovieModel &&
      other.id == id &&
      other.title == title &&
      other.hasVideo == hasVideo &&
      other.imageUrl == imageUrl &&
      other.overview == overview &&
      other.releaseDate == releaseDate &&
      listEquals(other.genreIds, genreIds);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      hasVideo.hashCode ^
      imageUrl.hashCode ^
      overview.hashCode ^
      releaseDate.hashCode ^
      genreIds.hashCode;
  }
}
