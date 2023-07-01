import 'package:dartz/dartz.dart';

import '../../../../core/error/errors.dart';
import '../model/cast_model.dart';

typedef ReturnFetchActoresMovies = Future<Either<Failure, List<CastEntity>>>;
