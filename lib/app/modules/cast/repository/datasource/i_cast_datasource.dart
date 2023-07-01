import 'package:movies/app/modules/cast/core/model/cast_model.dart';

abstract class ICastDatasource {
  Future<List<CastEntity>> getAllActores(int id);
}
