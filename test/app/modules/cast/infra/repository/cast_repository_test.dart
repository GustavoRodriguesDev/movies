import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/app/core/error/errors.dart';
import 'package:movies/app/modules/cast/domain/entity/cast_entity.dart';
import 'package:movies/app/modules/cast/domain/repository/cast_repository.dart';
import 'package:movies/app/modules/cast/infra/datasource/cast_datasource.dart';
import 'package:movies/app/modules/cast/infra/repository/cast_repository.dart';

class CatsDatasourceMock extends Mock implements ICastDatasource {}

void main() {
  late ICastDatasource datasource;
  late ICastRepository repository;
  setUpAll(() {
    datasource = CatsDatasourceMock();
    repository = CastRepository(datasource);
  });
  test('Deve retornar um ListCastEntity quando o metodo for chamado getAllActores for chamado', () async {
    when(() => datasource.getAllActores(1)).thenAnswer((_) async => []);
    final response = await repository.getAllActores(1);

    expect(response.isRight(), true);
    expect(response.fold((l) => l, (r) => r), isA<List<CastEntity>>());
    verify(() => datasource.getAllActores(1)).called(1);
  });

  test('Deve retornar uma Failure quando o metodo for chamado getAllActores for chamado', () async {
    when(() => datasource.getAllActores(1)).thenThrow(Failure(message: ''));
    final response = await repository.getAllActores(1);

    expect(response.isLeft(), true);
    expect(response.fold((l) => l, (r) => r), isA<Failure>());
    verify(() => datasource.getAllActores(1)).called(1);
  });
}
