// ignore_for_file: must_call_super

import 'package:flutter/cupertino.dart';
import 'package:movies/app/core/modules/movies/interactor/state/movie_state.dart';

import '../../../core/modules/movies/interactor/dto/paran_search_movie_dto.dart';
import '../../../core/modules/movies/interactor/service/i_movies_repository.dart';

class SearchMovieStore extends ValueNotifier<MovieState> {
  final IMoviesService _moviesRepository;
  SearchMovieStore(this._moviesRepository) : super(EmptyMovieState());

  Future<void> searchMovie(String movie) async {
    value = LoadingMovieState();
    value = await _moviesRepository
        .searchMovies(ParanSearchMovieDto(searchParan: movie));
  }

  @override
  void dispose() {
    value = EmptyMovieState();
  }
}
