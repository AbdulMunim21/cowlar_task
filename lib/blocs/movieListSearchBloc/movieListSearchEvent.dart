import 'package:cowlar_task/database/moviesApi.dart';
import 'package:cowlar_task/localdb/entities/movieEntity.dart';
import 'package:cowlar_task/model/movieModel.dart';
import 'package:equatable/equatable.dart';

abstract class MovieListSearchEvent extends Equatable {
  const MovieListSearchEvent();

  @override
  List<MovieModel> get props => [];
}

class GetSearchMovieList extends MovieListSearchEvent {
  final String query;
  const GetSearchMovieList({required this.query});
}
