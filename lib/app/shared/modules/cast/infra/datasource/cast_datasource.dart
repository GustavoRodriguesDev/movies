import 'package:movies/app/shared/modules/cast/domain/entity/cast_entity.dart';

abstract class ICastDatasource {
  Future<List<CastEntity>> getAllActores(int id);
}
