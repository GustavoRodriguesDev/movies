
import 'package:movies/app/modules/cast/domain/entity/cast_entity.dart';
import 'package:movies/app/modules/cast/external/error/cast_mapper_error.dart';


class CastMapper {
  static List<CastEntity> fromMap(List<Map<String, dynamic>> casts) {
    try {
      return casts
          .map((cast) => CastEntity(
                adult: cast['adult'],
                castId: cast['cast_id'],
                character: cast['character'],
                creditId: cast['credit_id'],
                gender: cast['gender'],
                id: cast['id'],
                knownForDepartment: cast['known_for_department'],
                name: cast['name'],
                order: cast['order'],
                originalName: cast['original_name'],
                popularity: cast['popularity'],
                profilePath: cast['profile_path'] ?? '',
              ))
          .toList();
    }  catch (e,s) {
      throw CastMapperError(message: e.toString(), stackTrace: s);
    }
  }
}
