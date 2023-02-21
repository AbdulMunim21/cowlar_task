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

  
}
