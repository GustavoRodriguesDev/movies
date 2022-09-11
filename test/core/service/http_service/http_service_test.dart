import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/core/error/errors.dart';
import 'package:movies/core/service/http_service/http_service.dart';
import 'package:movies/core/service/http_service/response_http_service.dart';

class DioMock extends Mock implements Dio {}

class RequestOptionsMock extends Mock implements RequestOptions {}

void main() {
  late Dio dio;
  late IHttpService service;

  setUpAll(() {
    dio = DioMock();
    service = HttpService(dio);
  });
  test('Deve retornar um ResponseHttpService quando o metodo get for chamado', () async {
    when(() => dio.get('')).thenAnswer((_) async => Response(requestOptions: RequestOptionsMock(), data: ''));

    final response = await service.get('');

    expect(response, isA<ResponseHttpService>());
    verify(() => dio.get('')).called(1);
  });

  test('Deve retonar um ServiceError quando o metodo for chamado', () {
    when(() => dio.get('')).thenThrow(DioError(requestOptions: RequestOptionsMock()));
    final response = service.get('');
    expect(response, throwsA(isA<ServiceError>()));
    verify(() => dio.get('')).called(1);
  });
}
