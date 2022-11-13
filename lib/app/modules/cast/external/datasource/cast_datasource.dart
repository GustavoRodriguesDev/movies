import 'package:movies/app/modules/cast/domain/entity/cast_entity.dart';
import 'package:movies/app/modules/cast/infra/datasource/cast_datasource.dart';

import '../../../../core/service/http_service/http_service.dart';

class CastDatasource implements ICastDatasource {
  final IHttpService http;

  CastDatasource(this.http);
  @override
  Future<List<CastEntity>> getAllActores(int id) async {
    try {
      final response = http.get('');
    } catch (e) {}
  }
}
