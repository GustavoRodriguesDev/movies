import 'package:flutter/cupertino.dart';
import '../../../../cast/domain/usecase/fetch_all_actores_movie.dart';
import 'state/state_details_movies.dart';

class DetaisMoviesStore extends ValueNotifier<DetailsMoviesState> {
  final IFetchAllActoresMovies fetchAllActoresMovies;
  DetaisMoviesStore(this.fetchAllActoresMovies) : super(EmpityDetailsMoviesState());

  Future<void> fetchAllActors(int movieId) async {
    value = LoadingDetailsMoviesState();
    final response = await fetchAllActoresMovies(movieId);

    response.fold(
      (error) => value = ErrorDetailsMoviesState(error),
      (casts) => value = SuccessDetailsMoviesState(casts),
    );
  }
}
