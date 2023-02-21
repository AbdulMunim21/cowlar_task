abstract class GenreListState {
  final genreList;
  GenreListState(this.genreList);
}

class GenreListInitialState extends GenreListState {
  GenreListInitialState():super([]);
}

class GenreListLoadingState extends GenreListState {
  GenreListLoadingState() :super([]);
}

class GenreListLoadedState extends GenreListState {
  late final List genre;

  GenreListLoadedState(List genres) : super(genres);
}

class GenreListErrorState extends GenreListState {
  final String? message;
  GenreListErrorState(this.message) : super([]);
}
