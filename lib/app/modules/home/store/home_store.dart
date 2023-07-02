import 'package:flutter/cupertino.dart';

import '../../movies/interactor/dto/pagination_movie_dto.dart';
import '../../movies/interactor/service/i_movies_repository.dart';
import '../../movies/interactor/state/movie_state.dart';

class HomeStore extends ValueNotifier<MovieState> {
  final IMoviesRepository _moviesRepository;
  HomeStore(this._moviesRepository) : super(EmptyMovieState());

  Future<void> fetchAllMovies() async {
    value = LoadingMovieState();
    value = await _moviesRepository.getAllMovies(const PaginationMovieDto());
  }
}
