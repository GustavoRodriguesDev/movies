import 'package:movies/app/core/error/errors.dart';
import 'package:movies/app/modules/cast/domain/entity/cast_entity.dart';

class DetailsMoviesState {}

class SuccessDetailsMoviesState extends DetailsMoviesState {
  final List<CastEntity> listCast;

  SuccessDetailsMoviesState(this.listCast);
}

class ErrorDetailsMoviesState extends DetailsMoviesState {
  final Failure error;

  ErrorDetailsMoviesState(this.error);
}

class EmpityDetailsMoviesState extends DetailsMoviesState {}
class LoadingDetailsMoviesState extends DetailsMoviesState {}
