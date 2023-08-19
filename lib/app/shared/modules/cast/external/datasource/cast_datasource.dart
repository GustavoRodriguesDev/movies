// ignore_for_file: unused_catch_clause
import 'package:core/core.dart';
import 'package:movies/app/shared/modules/cast/domain/entity/cast_entity.dart';
import 'package:movies/app/shared/modules/cast/external/mapper/cast_mapper.dart';
import 'package:movies/app/shared/modules/cast/infra/datasource/cast_datasource.dart';

import '../../../../constants/movies_api.dart';

class CastDatasource implements ICastDatasource {
  final IHttpService http;

  CastDatasource(this.http);
  @override
  Future<List<CastEntity>> getAllActores(int movieId) async {
    try {
      final response = await http
          .get('${ApiConstants.movie}/$movieId${ApiConstants.credits}');

      final listCast = CastMapper.fromMap(response.data['cast']);
      return listCast;
    } on Failure catch (e) {
      rethrow;
    }
  }
}
