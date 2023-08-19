import 'package:core/core.dart';
import 'package:movies/app/shared/modules/cast/domain/entity/cast_entity.dart';
import 'package:movies/app/shared/modules/movies/domain/entities/movie_entity.dart';

class DetailsMoviesState {}

class SuccessDetailsMoviesState extends DetailsMoviesState {
  final List<CastEntity> listCast;
  final List<MovieEntity> movieEntity;

  SuccessDetailsMoviesState(
      {this.listCast = const [], this.movieEntity = const []});

  SuccessDetailsMoviesState copyWith({
    List<CastEntity>? listCast,
    List<MovieEntity>? movieEntity,
  }) {
    return SuccessDetailsMoviesState(
      listCast: listCast ?? this.listCast,
      movieEntity: movieEntity ?? this.movieEntity,
    );
  }
}

class ErrorDetailsMoviesState extends DetailsMoviesState {
  final Failure error;

  ErrorDetailsMoviesState(this.error);
}

class EmpityDetailsMoviesState extends DetailsMoviesState {}

class LoadingDetailsMoviesState extends DetailsMoviesState {}
