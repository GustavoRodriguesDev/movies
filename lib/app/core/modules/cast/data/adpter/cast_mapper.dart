import '../../interactor/error/cast_mapper_error.dart';
import '../../interactor/model/cast_model.dart';

class CastMapper {
  static List<CastModel> fromMap(List casts) {
    try {
      return casts
          .map((cast) => CastModel(
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
                profilePath: cast['profile_path'] ?? '',
              ))
          .toList();
    } catch (e, s) {
      throw CastMapperError(message: e.toString(), stackTrace: s);
    }
  }
}
