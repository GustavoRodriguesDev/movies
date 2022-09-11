import 'package:movies/core/error/errors.dart';

class MovieMapperError extends Failure {
  MovieMapperError({required super.message, super.stackTrace});
}
