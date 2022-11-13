import 'package:movies/app/modules/cast/domain/entity/cast_entity.dart';

abstract class ICastDatasource {
  Future<List<CastEntity>> getAllActores(int id);
}
