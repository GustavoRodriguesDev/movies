// ignore_for_file: must_call_super

import 'package:flutter/cupertino.dart';
import 'package:movies/app/modules/home/subpage/search_movie/store/state/search_state.dart';

import '../../../../movies/domain/dto/paran_search_movie_dto.dart';
import '../../../../movies/domain/usecase/search_movie.dart';

class SearchMovieStore extends ValueNotifier<SearchState> {
  final ISearchMovieUsecase _searchMovieUsecase;
  SearchMovieStore(this._searchMovieUsecase) : super(InitSearchState());

  Future<void> searchMovie(String movie) async {
    value = LoadingSearchState();
    final result = await _searchMovieUsecase(ParanSearchMovieDto(searchParan: movie));

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
