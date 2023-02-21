import 'package:cowlar_task/blocs/movieListBloc/movieListEvent.dart';
import 'package:cowlar_task/blocs/movieListBloc/movieListState.dart';
import 'package:cowlar_task/database/moviesApi.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  MovieListBloc() : super(MovieListInitial()) {
    // print("========================================");
    final movieDatabaseAPI = MoviesAPI();
    on<GetMovieList>((event, emit) async {
      try {
        // print("Calling");
        emit(MovieListLoading());
        final movieList = await movieDatabaseAPI.getAllMovies();
        // print(movieList);
        emit(MovieListLoaded(movieList));
      } catch (e) {
        emit(const MovieListError("Something Went Wrong"));
      }
    });
  }
}
