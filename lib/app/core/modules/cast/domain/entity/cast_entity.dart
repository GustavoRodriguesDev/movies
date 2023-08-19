class CastEntity {
  final bool adult;
  final int gender;
  final int id;
  
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;

  CastEntity({
    this.adult = false,
    this.gender = 0,
    this.id = 0,
   
    this.name = '',
    this.originalName = '',
    this.popularity = 0,
    this.profilePath = '',
    this.castId = 0,
    this.character = '',
    this.creditId = '',
    this.order = 0,
  });
}
