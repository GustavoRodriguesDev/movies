import 'package:dartz/dartz.dart';

import '../../../../core/error/errors.dart';
import '../entity/cast_entity.dart';

typedef ReturnFetchActoresMovies = Future<Either<Failure, List<CastEntity>>>;
