import 'package:cowlar_task/database/moviesApi.dart';
import 'package:cowlar_task/localdb/entities/movieEntity.dart';
import 'package:cowlar_task/model/movieModel.dart';
import 'package:equatable/equatable.dart';

abstract class MovieListEvent extends Equatable {
  const MovieListEvent();

  @override
  List<MovieModel> get props => [];
}

class GetMovieList extends MovieListEvent {}
