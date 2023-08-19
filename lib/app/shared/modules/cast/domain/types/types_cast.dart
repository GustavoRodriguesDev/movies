import 'package:core/core.dart';

import '../entity/cast_entity.dart';

typedef ReturnFetchActoresMovies = Future<Either<Failure, List<CastEntity>>>;
