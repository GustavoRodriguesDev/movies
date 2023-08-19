import 'package:movies/app/shared/modules/cast/domain/entity/cast_entity.dart';
import 'package:movies/app/shared/modules/cast/external/error/cast_mapper_error.dart';

import '../../../../constants/movies_api.dart';

class CastMapper {
  static List<CastEntity> fromMap(List casts) {
    try {
      return casts
          .map((cast) => CastEntity(
                adult: cast['adult'],
                castId: cast['cast_id'],
                character: cast['character'],
                creditId: cast['credit_id'],
                gender: cast['gender'],
                id: cast['id'],
                name: cast['name'],
                order: cast['order'],
                originalName: cast['original_name'],
                popularity: cast['popularity'],
                profilePath: ApiConstants.image + (cast['profile_path']??''),
              ))
          .toList();
    } catch (e, s) {
      throw CastMapperError(message: e.toString(), stackTrace: s);
    }
  }
}
