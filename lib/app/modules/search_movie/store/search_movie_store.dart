// ignore_for_file: must_call_super

import 'package:flutter/cupertino.dart';
import 'package:movies/app/modules/search_movie/store/state/search_state.dart';

import '../../movies/core/dto/paran_search_movie_dto.dart';
import '../../movies/repository/i_movies_repository.dart';

class SearchMovieStore extends ValueNotifier<SearchState> {
  final IMoviesRepository _moviesRepository;
  SearchMovieStore(this._moviesRepository) : super(InitSearchState());

  Future<void> searchMovie(String movie) async {
    value = LoadingSearchState();
    final result =
        await _moviesRepository.searchMovies(ParanSearchMovieDto(searchParan: movie));

    result.fold(
      (l) => value = ErrorSearchState(l),
      (r) {
        if (r.isEmpty) {
          value = EmptySearchState();
        } else {
          value = SuccessSearchState(listMovies: r);
        }
      },
    );
  }

  @override
  void dispose() {
    value = InitSearchState();
  }
}
