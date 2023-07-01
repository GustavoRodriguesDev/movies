import 'package:movies/app/core/error/errors.dart';
import 'package:movies/app/modules/cast/core/model/cast_model.dart';
import 'package:movies/app/modules/movies/domain/entities/movie_entity.dart';

class DetailsMoviesState {}

class SuccessDetailsMoviesState extends DetailsMoviesState {
  final List<CastEntity> listCast;
  final List<MovieEntity> movieEntity;

  SuccessDetailsMoviesState({this.listCast = const [], this.movieEntity = const []});

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
