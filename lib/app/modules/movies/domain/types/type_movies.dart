import 'package:dartz/dartz.dart';
import '../../../../core/error/errors.dart';
import '../entities/movie_entity.dart';

typedef ReturnFetchMovies = Future<Either<Failure, List<MovieEntity>>>;
