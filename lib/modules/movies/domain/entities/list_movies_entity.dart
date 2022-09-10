import 'package:movies/modules/movies/domain/entities/movie_entity.dart';

class ListMovieEntity {
  final List<MovieEntity> listMovies;

 const ListMovieEntity({this.listMovies = const []});
}
