import 'package:dartz/dartz.dart';
import 'package:movies/app/core/error/errors.dart';
import 'package:movies/app/modules/cast/domain/repository/cast_repository.dart';
import 'package:movies/app/modules/cast/domain/types/types_cast.dart';

import '../datasource/cast_datasource.dart';

class CastRepository implements ICastRepository {
  final ICastDatasource datasource;
  CastRepository(this.datasource);
  @override
  ReturnFetchActoresMovies getAllActores(int movieId) async {
    try {
      final response = await datasource.getAllActores(movieId);
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
