import 'package:cowlar_task/blocs/movieListBloc/movieListState.dart';
import 'package:cowlar_task/blocs/movieListSearchBloc/movieListSearchEvent.dart';
import 'package:cowlar_task/blocs/movieListSearchBloc/movieListSearchState.dart';
import 'package:cowlar_task/database/moviesApi.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieListSearchBloc
    extends Bloc<MovieListSearchEvent, MovieListSearchState> {
  MovieListSearchBloc() : super(MovieListSearchInitial()) {
    final movieDatabaseAPI = MoviesAPI();
    on<GetSearchMovieList>((event, emit) async {
      try {
        emit(MovieListSearchLoading());
        final movieList = await movieDatabaseAPI.getSearchMovie(event.query);

        emit(MovieListSearchLoaded(movieList));
      } catch (e) {
        emit(const MovieListSearchError("Something Went Wrong"));
      }
    });
  }
}
