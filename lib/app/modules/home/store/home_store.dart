import 'package:flutter/cupertino.dart';

import '../../movies/core/dto/pagination_movie_dto.dart';
import '../../movies/repository/i_movies_repository.dart';
import 'state/home_state.dart';

class HomeStore extends ValueNotifier<HomeState> {
  final IMoviesRepository _moviesRepository;
  HomeStore(this._moviesRepository) : super(EmpityHomeState());

  Future<void> fetchAllMovies() async {
    value = LoadingHomeState();
    final movies =
        await _moviesRepository.getAllMovies(const PaginationMovieDto());

    movies.fold(
      (l) => value = ErrorHomeState(l),
      (r) => value = SuccesHomeState(listMovies: r),
    );
  }
}
