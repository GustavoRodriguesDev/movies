import 'package:flutter/cupertino.dart';

import '../../movies/domain/dto/pagination_movie_dto.dart';
import '../../movies/domain/usecase/fetch_all_movies_usecase.dart';
import 'state/home_state.dart';

class HomeStore extends ValueNotifier<HomeState> {
  final IFetchAllMoviesUsecase _usecase;
  HomeStore(this._usecase) : super(EmpityHomeState());

  Future<void> fetchAllMovies() async {
    value = LoadingHomeState();
    final movies = await _usecase(const PaginationMovieDto());

    movies.fold(
      (l) => value = ErrorHomeState(l),
      (r) => value = SuccesHomeState(listMovies: r),
    );
  }
}
