import 'package:core/src/error/errors.dart';
import 'package:core/src/service/http_service/http_service.dart';
import 'package:core/src/service/http_service/response_http_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/app/shared/modules/cast/domain/entity/cast_entity.dart';
import 'package:movies/app/shared/modules/cast/external/datasource/cast_datasource.dart';
import 'package:movies/app/shared/modules/cast/external/error/cast_mapper_error.dart';
import 'package:movies/app/shared/modules/cast/infra/datasource/cast_datasource.dart';

class HttpServiceMock extends Mock implements IHttpService {}

void main() {
  late IHttpService http;
  late ICastDatasource datasource;

  setUpAll(() {
    http = HttpServiceMock();
    datasource = CastDatasource(http);
  });

  test(
      'Deve retornar um ListCastEntity quando o metodo for chamado getAllActores for chamado',
      () async {
    when(() => http.get(any())).thenAnswer((_) async => ResponseHttpService(
          data: responseMock,
          statusCode: 200,
        ));
    final response = await datasource.getAllActores(1);
    expect(response, isA<List<CastEntity>>());
  });
  test(
      'Deve retornar uma Failure quando o metodo for chamado getAllActores for chamado',
      () async {
    when(() => http.get(any())).thenThrow(ServiceError(message: ''));
    final response = datasource.getAllActores(1);
    expect(response, throwsA(isA<Failure>()));
  });
  test(
      'Deve retornar um CastMapperError quando o metodo for chamado getAllActores for chamado',
      () {
    when(() => http.get(any())).thenAnswer((_) async => ResponseHttpService(
          data: responseErrorMock,
          statusCode: 200,
        ));
    final response = datasource.getAllActores(1);
    expect(response, throwsA(isA<CastMapperError>()));
  });
}

final responseMock = {
  "id": 625,
  "cast": [
    {
      "adult": false,
      "gender": 2,
      "cast_id": 8970,
      "known_for_department": "Editing",
      "name": "Jim Clark",
      "original_name": "Jim Clark",
      "popularity": 0.786,
      "profile_path": "/sQ6hauV0xjvIOwMebG2tM9DJ6RF.jpg",
      "credit_id": "52fe4260c3a36847f80197b1",
      "department": "Editing",
      "job": "Editor",
      "character": "Shuri",
      "id": 1,
      "order": 0,
    },
    {
      "adult": false,
      "gender": 1,
      "cast_id": 8971,
      "known_for_department": "Production",
      "name": "Pat Golden",
      "original_name": "Pat Golden",
      "popularity": 0.6,
      "profile_path": "/83ZwBFc01QO4Y5qMnT6B6NPmg9C.jpg",
      "credit_id": "52fe4260c3a36847f80197c3",
      "department": "Production",
      "job": "Casting",
      "character": "Shuri",
      "id": 1,
      "order": 0,
    },
    {
      "adult": false,
      "gender": 2,
      "cast_id": 8973,
      "known_for_department": "Art",
      "name": "Steve Spence",
      "original_name": "Steve Spence",
      "popularity": 1.38,
      "profile_path": null,
      "credit_id": "52fe4260c3a36847f80197db",
      "department": "Art",
      "job": "Art Direction",
      "character": "Shuri",
      "id": 1,
      "order": 0,
    },
    {
      "adult": false,
      "gender": 0,
      "cast_id": 8974,
      "known_for_department": "Costume & Make-Up",
      "name": "Judy Moorcroft",
      "original_name": "Judy Moorcroft",
      "popularity": 0.828,
      "profile_path": null,
      "credit_id": "52fe4260c3a36847f80197e1",
      "department": "Costume & Make-Up",
      "job": "Costume Design",
      "character": "Shuri",
      "id": 1,
      "order": 0,
    },
    {
      "adult": false,
      "gender": 2,
      "cast_id": 40796,
      "known_for_department": "Camera",
      "name": "David Appleby",
      "original_name": "David Appleby",
      "popularity": 1.228,
      "profile_path": "/b8zskcykOOugn31axyHn5qB8hdn.jpg",
      "credit_id": "5c28b9580e0a26793036e2e0",
      "department": "Camera",
      "job": "Still Photographer",
      "character": "Shuri",
      "id": 1,
      "order": 0,
    },
    {
      "adult": false,
      "gender": 0,
      "cast_id": 2191776,
      "known_for_department": "Sound",
      "name": "Judy Freeman",
      "original_name": "Judy Freeman",
      "popularity": 0.6,
      "profile_path": null,
      "credit_id": "5c2628b6c3a3687300c2ee99",
      "department": "Crew",
      "job": "Video Assist Operator",
      "character": "Shuri",
      "id": 1,
      "order": 0,
    }
  ]
};
final responseErrorMock = {
  "id": 625,
  "cast": [
    {
      "adult": false,
      "gender": 2,
      "id": '8970',
      "known_for_department": "Editing",
      "name": "Jim Clark",
      "original_name": "Jim Clark",
      "popularity": 0.786,
      "profile_path": "/sQ6hauV0xjvIOwMebG2tM9DJ6RF.jpg",
      "credit_id": "52fe4260c3a36847f80197b1",
      "department": "Editing",
      "job": "Editor"
    },
    {
      "adult": false,
      "gender": 1,
      "id": 8971,
      "known_for_department": "Production",
      "name": "Pat Golden",
      "original_name": "Pat Golden",
      "popularity": 0.6,
      "profile_path": "/83ZwBFc01QO4Y5qMnT6B6NPmg9C.jpg",
      "credit_id": "52fe4260c3a36847f80197c3",
      "department": "Production",
      "job": "Casting"
    },
    {
      "adult": false,
      "gender": 2,
      "id": 8973,
      "known_for_department": "Art",
      "name": "Steve Spence",
      "original_name": "Steve Spence",
      "popularity": 1.38,
      "profile_path": null,
      "credit_id": "52fe4260c3a36847f80197db",
      "department": "Art",
      "job": "Art Direction"
    },
    {
      "adult": false,
      "gender": 0,
      "id": 8974,
      "known_for_department": "Costume & Make-Up",
      "name": "Judy Moorcroft",
      "original_name": "Judy Moorcroft",
      "popularity": 0.828,
      "profile_path": null,
      "credit_id": "52fe4260c3a36847f80197e1",
      "department": "Costume & Make-Up",
      "job": "Costume Design"
    },
    {
      "adult": false,
      "gender": 2,
      "id": 40796,
      "known_for_department": "Camera",
      "name": "David Appleby",
      "original_name": "David Appleby",
      "popularity": 1.228,
      "profile_path": "/b8zskcykOOugn31axyHn5qB8hdn.jpg",
      "credit_id": "5c28b9580e0a26793036e2e0",
      "department": "Camera",
      "job": "Still Photographer"
    },
    {
      "adult": false,
      "gender": 0,
      "id": 2191776,
      "known_for_department": "Sound",
      "name": "Judy Freeman",
      "original_name": "Judy Freeman",
      "popularity": 0.6,
      "profile_path": null,
      "credit_id": "5c2628b6c3a3687300c2ee99",
      "department": "Crew",
      "job": "Video Assist Operator"
    }
  ]
};
