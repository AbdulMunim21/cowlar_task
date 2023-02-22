import 'package:bloc_test/bloc_test.dart';
import 'package:cowlar_task/blocs/movieListBloc/movieListBloc.dart';
import 'package:cowlar_task/blocs/movieListBloc/movieListEvent.dart';
import 'package:cowlar_task/blocs/movieListBloc/movieListState.dart';
import 'package:cowlar_task/constants/keys.dart';
import 'package:cowlar_task/model/movieModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);

  dio.httpClientAdapter = dioAdapter;

  group('MovieList Bloc Testing', () {
    late MovieListBloc movieListBloc;

    setUp(() {
      movieListBloc = MovieListBloc();
    });

    test("initial State Test", () {
      expect(movieListBloc.state, MovieListInitial());
    });

    blocTest<MovieListBloc, MovieListState>(
      "Got Movies List Error Test",
      build: () => movieListBloc,
      act: (bloc) => bloc.add(GetMovieList()),
      expect: () =>
          <MovieListState>[MovieListLoading(), const MovieListError("")],
    );
  });
}
