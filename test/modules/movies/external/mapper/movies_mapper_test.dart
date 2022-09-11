import 'package:flutter_test/flutter_test.dart';
import 'package:movies/app/modules/movies/domain/entities/movie_entity.dart';
import 'package:movies/app/modules/movies/external/mapper/movies_mapper.dart';
void main() {
  test('Deve retornar uma List<MovieEntity> quando o metodo for chamado', () async {
    final list = MoviesMapper.fromJson(json);

    expect(list, isA<List<MovieEntity>>());
  });
}

final json = [
  {
    "adult": false,
    "backdrop_path": "/2RSirqZG949GuRwN38MYCIGG4Od.jpg",
    "genre_ids": [53],
    "id": 985939,
    "original_language": "en",
    "original_title": "Fall",
    "overview":
        "Becky e Hunter são duas amigas que buscam aventura e enfrentam grande alturas em suas escaladas. Depois de um grande drama vivido por elas, as duas decidem escalar uma remota torre de rádio abandonada com mais de 2000 pés de altura. Parecia a aventura perfeita para desligar a mente do trágico acontecimento que vivenciaram com o namorado de uma delas. Elas não contavam que ficariam presas e isoladas naquele lugar sem sinal de celular, sem energia e sem pessoas por perto.",
    "popularity": 6731.327,
    "poster_path": "/sjnijtgU3Khzou1S9412V30pP7L.jpg",
    "release_date": "2022-08-11",
    "title": "A Queda",
    "video": false,
    "vote_average": 7.4,
    "vote_count": 346
  },
  {
    "adult": false,
    "backdrop_path": "/ugS5FVfCI3RV0ZwZtBV3HAV75OX.jpg",
    "genre_ids": [16, 878, 28],
    "id": 610150,
    "original_language": "ja",
    "original_title": "ドラゴンボール超 スーパーヒーロー",
    "overview":
        "Com suas capas balançando, Gamma 1 e Gamma 2 podem ser vistos fazendo algumas poses incríveis! Além disso, há alguns novos personagens originais que teremos que esperar para descobrir mais, não importa o quão difícil possa ser! Vestindo seu uniforme e tomando o centro do palco está Gohan, que parece estar se preparando para a luta de uma vida ao lado de Piccolo, Goku, Vegeta e Pan! (sinopse temporária)",
    "popularity": 5953.989,
    "poster_path": "/FiqBRypTDyHzqcxdbpPb3ddFep.jpg",
    "release_date": "2022-06-11",
    "title": "Dragon Ball Super: Super Hero",
    "video": false,
    "vote_average": 8,
    "vote_count": 1426
  },
  {
    "adult": false,
    "backdrop_path": "/jsoz1HlxczSuTx0mDl2h0lxy36l.jpg",
    "genre_ids": [28, 12, 14],
    "id": 616037,
    "original_language": "en",
    "original_title": "Thor: Love and Thunder",
    "overview":
        "Thor parte em uma jornada de autodescoberta, diferente de tudo que ele já enfrentou. Mas seus esforços são interrompidos por um assassino galáctico conhecido como Gorr, o Carniceiro dos Deuses, que busca a extinção dos deuses. Para combater esta ameaça, Thor pede a ajuda da Rei Valquíria, Korg e da ex-namorada Jane Foster, que, para a surpresa de Thor, inexplicavelmente empunha seu mágico martelo, Mjolnir, como a Poderosa Thor. Juntos, eles embarcam em uma angustiante aventura cósmica para descobrir o mistério da vingança do Carniceiro dos Deuses e detê-lo antes que seja tarde demais.",
    "popularity": 5471.218,
    "poster_path": "/71XnRvkadkWZZowCGcuBi4XAKdJ.jpg",
    "release_date": "2022-07-06",
    "title": "Thor: Amor e Trovão",
    "video": false,
    "vote_average": 6.8,
    "vote_count": 2846
  },
];
