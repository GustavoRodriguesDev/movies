import 'package:flutter/cupertino.dart';
import 'package:movies/app/core/error/errors.dart';
import 'package:movies/app/modules/movies/domain/usecase/fetch_similar_movies_usecase.dart';

import '../../cast/core/model/cast_model.dart';
import '../../cast/repository/i_cast_repository.dart';
import '../../movies/domain/entities/movie_entity.dart';
import 'state/state_details_movies.dart';

class DetaisMoviesStore extends ValueNotifier<DetailsMoviesState> {
  final ICastRepository actoresMovies;
  final IFetchSimilarMoviesUsecase fetchSimilarMoviesUsecase;
  DetaisMoviesStore({
    required this.actoresMovies,
    required this.fetchSimilarMoviesUsecase,
  }) : super(EmpityDetailsMoviesState());

  Future<void> initalDetails(int movieId) async {
    value = LoadingDetailsMoviesState();
    try {
      List<CastEntity> casts = await _fetchAllActors(movieId);
      List<MovieEntity> movies = await _fetchSimilarMovies(movieId);
      value = SuccessDetailsMoviesState(listCast: casts, movieEntity: movies);
    } on Failure catch (error) {
      value = ErrorDetailsMoviesState(error);
    }
  }

  Future<List<CastEntity>> _fetchAllActors(int movieId) async {
    final response = await actoresMovies.getAllActores(movieId);

    return response.fold(
      (error) {
        throw error;
      },
      (casts) {
        return casts;
      },
    );
  }

  Future<List<MovieEntity>> _fetchSimilarMovies(int movieId) async {
    final response = await fetchSimilarMoviesUsecase(movieId);
    return response.fold(
      (error) {
        throw error;
      },
      (movie) {
        return movie;
      },
    );
  }
}
