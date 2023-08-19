import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/app/core/error/errors.dart';
import 'package:movies/app/core/modules/cast/domain/entity/cast_entity.dart';
import 'package:movies/app/core/modules/cast/domain/repository/cast_repository.dart';
import 'package:movies/app/core/modules/cast/domain/usecase/fetch_all_actores_movie.dart';

class CastRepositoryMock extends Mock implements ICastRepository {}

void main() {
  late ICastRepository repository;
  late IFetchAllActoresMovies usecase;
  setUpAll(() {
    repository = CastRepositoryMock();
    usecase = FetchAllActoresMovies(repository);
  });
  test('Deve retornar uma lista de MoviesEntity quando o metodo for chamado', () async {
    when(() => repository.getAllActores(1)).thenAnswer((_) async => const Right(<CastEntity>[]));

    final response = await usecase.call(1);

    expect(response.isRight(), true);
    // expect(response.fold(id, id), isA<List<CastEntity>>());
    // verify(() => repository.getAllActores(1)).called(1);
  });
  test('Deve retornar uma Failure quando o metodo for chamado', () async {
    when(() => repository.getAllActores(0)).thenAnswer((_) async => Left(Failure(message: '')));

    final response = await usecase(0);

    expect(response.isLeft(), true);
    expect(response.fold(id, id), isA<Failure>());
    verify(() => repository.getAllActores(0)).called(1);
  });
}
