import 'package:dartz/dartz.dart';

abstract class Failure {
  final String message;
  final StackTrace? stackTrace;

  Failure({required this.message,  this.stackTrace});
}

class DomainError extends Failure {
  DomainError({required super.message,  super.stackTrace});
}

class RepositoryError extends Failure {
  RepositoryError({required super.message,  super.stackTrace});
}

class DatasourceError extends Failure {
  DatasourceError({required super.message,  super.stackTrace});
}

class ServiceError extends Failure {
  ServiceError({required super.message,  super.stackTrace});
}
