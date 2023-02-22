import 'package:cowlar_task/blocs/movieListSearchBloc/movieListSearchEvent.dart';
import 'package:cowlar_task/blocs/movieListSearchBloc/movieListSearchState.dart';
import 'package:cowlar_task/database/moviesApi.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieListSearchBloc
    extends Bloc<MovieListSearchEvent, MovieListSearchState> {
  final movieDatabaseAPI = MoviesAPI();
  MovieListSearchBloc() : super(MovieListSearchInitial()) {
    on<GetSearchMovieList>((event, emit) async {
      try {
        emit(MovieListSearchLoading());
        print(event.query);
        final movieList = await movieDatabaseAPI.getSearchMovie(event.query);
        emit(MovieListSearchLoaded(movieList));
        print(movieList);
      } catch (e) {
        print(e.toString());
        emit(MovieListSearchError(e.toString()));
      }
    });
  }
}
