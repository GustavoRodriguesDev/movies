import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:movies/app/shared/modules/movies/domain/usecase/fetch_similar_movies_usecase.dart';

import '../../../shared/modules/cast/domain/entity/cast_entity.dart';
import '../../../shared/modules/cast/domain/usecase/fetch_all_actores_movie.dart';
import '../../../shared/modules/movies/domain/entities/movie_entity.dart';
import 'state/state_details_movies.dart';

class DetaisMoviesStore extends ValueNotifier<DetailsMoviesState> {
  final IFetchAllActoresMovies fetchAllActoresMovies;
  final IFetchSimilarMoviesUsecase fetchSimilarMoviesUsecase;
  DetaisMoviesStore({
    required this.fetchAllActoresMovies,
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
    final response = await fetchAllActoresMovies(movieId);

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
