import 'package:cowlar_task/blocs/genreListBloc/genreListEvent.dart';
import 'package:cowlar_task/blocs/genreListBloc/genreListState.dart';
import 'package:cowlar_task/database/moviesApi.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenreListBloc extends Bloc<GenreListEvent, GenreListState> {
  GenreListBloc() : super(GenreListInitialState()) {
    final movieDatabaseAPI = MoviesAPI();
    on<GetGenreList>((event, emit) async {
      try {
        emit(GenreListLoadingState());
        final genreList = await movieDatabaseAPI.getAllGenres();
        emit(GenreListLoadedState(genreList));
      } catch (e) {
        emit(GenreListErrorState("Something Went Wrong"));
      }
    });
  }
}
