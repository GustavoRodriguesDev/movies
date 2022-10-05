import 'package:dartz/dartz.dart';
import 'package:movies/app/modules/movies/domain/entities/cast_entity.dart';

import '../../../../core/error/errors.dart';
import '../entities/movie_entity.dart';

typedef ReturnFetchMovies = Future<Either<Failure, List<MovieEntity>>>;
typedef ReturnFetchActoresMovies = Future<Either<Failure, List<CastEntity>>>;
