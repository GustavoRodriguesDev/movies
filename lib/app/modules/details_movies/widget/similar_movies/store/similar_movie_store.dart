import 'package:flutter/material.dart';
import 'package:movies/app/modules/movies/interactor/state/movie_state.dart';

import '../../../../movies/interactor/service/i_movies_repository.dart';

class SimilarMovieStore extends ValueNotifier<MovieState> {
  final IMoviesRepository moviesRepository;
  SimilarMovieStore(
    this.moviesRepository,
  ) : super(EmptyMovieState());

  Future<void> fetchSimilarMovies(int movieId) async {
    value = LoadingMovieState();
    value = await moviesRepository.getSimilarMovies(movieId);
  }
}
