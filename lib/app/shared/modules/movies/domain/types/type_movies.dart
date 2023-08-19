import 'package:core/core.dart';

import '../entities/movie_entity.dart';

typedef ReturnFetchMovies = Future<Either<Failure, List<MovieEntity>>>;
