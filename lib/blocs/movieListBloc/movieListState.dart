// part of 'movieBloc.dart';

import 'package:equatable/equatable.dart';

import '../../model/movieModel.dart';

abstract class MovieListState extends Equatable {
  const MovieListState();

  @override
  List<MovieModel> get props => [];
} 

class MovieListInitial extends MovieListState {}

class MovieListLoading extends MovieListState {}

class MovieListLoaded extends MovieListState {
  late final List<MovieModel> movieList;

  MovieListLoaded(List<MovieModel> newMovieList) {
    // ignore: unnecessary_this
    this.movieList = newMovieList;
  }
}

class MovieListError extends MovieListState {
  final String? message;
  const MovieListError(this.message);
}
