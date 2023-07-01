import 'package:dartz/dartz.dart';
import '../../../../core/error/errors.dart';
import '../model/movie_model.dart';

typedef ReturnFetchMovies = Future<Either<Failure, List<MovieEntity>>>;
