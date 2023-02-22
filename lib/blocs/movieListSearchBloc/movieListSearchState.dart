// part of 'movieBloc.dart';

import 'package:equatable/equatable.dart';

import '../../model/movieModel.dart';

abstract class MovieListSearchState extends Equatable {
  const MovieListSearchState();

  @override
  List<MovieModel> get props => [];
}

class MovieListSearchInitial extends MovieListSearchState {}

class MovieListSearchLoading extends MovieListSearchState {}

class MovieListSearchLoaded extends MovieListSearchState {
  final List<MovieModel> movieList;

  const MovieListSearchLoaded(this.movieList);
}

class MovieListSearchError extends MovieListSearchState {
  final String? message;
  const MovieListSearchError(this.message);
}
