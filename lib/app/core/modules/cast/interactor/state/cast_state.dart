import 'package:movies/app/core/error/errors.dart';

import '../model/cast_model.dart';

sealed class CastState {}

class SuccesCastState extends CastState {
  final List<CastModel> listCast;

  SuccesCastState({required this.listCast});
}

class ErrorCastState extends CastState {
  final Failure failure;

  ErrorCastState({required this.failure});
}

class InitCastState extends CastState {}

class LoadingCastState extends CastState {}
