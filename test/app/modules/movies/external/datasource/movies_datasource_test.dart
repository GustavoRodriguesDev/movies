import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/app/core/error/errors.dart';
import 'package:movies/app/core/service/http_service/http_service.dart';
import 'package:movies/app/core/service/http_service/response_http_service.dart';
import 'package:movies/app/modules/movies/domain/dto/pagination_movie_dto.dart';
import 'package:movies/app/modules/movies/domain/dto/paran_search_movie_dto.dart';
import 'package:movies/app/modules/movies/domain/entities/movie_entity.dart';
import 'package:movies/app/modules/movies/external/datasource/movies_datasource.dart';
import 'package:movies/app/modules/movies/external/error/movie_mapper_error.dart';
import 'package:movies/app/modules/movies/infra/datasource/movies_datasource.dart';

class HttpServiceMock extends Mock implements IHttpService {}

void main() {
  late IHttpService http;
  late IMoviesDatasource datasource;
  setUpAll(() {
    http = HttpServiceMock();
    datasource = MoviesDatasource(http);
  });
  PaginationMovieDto page = const PaginationMovieDto();
  ParanSearchMovieDto paran = const ParanSearchMovieDto();
  group('testes metodo getAllMovies', () {
    test('Deve retornar uma lista de MovieEntity quando o metodo getAllMovies for chamado ', () async {
      when(() => http.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenAnswer((_) async => ResponseHttpService(json));

      final response = await datasource.getAllMovies(page);

      expect(response, isA<List<MovieEntity>>());
    });
    test('Deve retornar uma Failure quando o metodo getAllMovies for chamado ', () {
      when(() => http.get(any(), queryParameters: any(named: 'queryParameters'))).thenThrow(ServiceError(message: ''));

      final response = datasource.getAllMovies(page);

      expect(response, throwsA(isA<Failure>()));
    });
    test('Deve retornar uma MovieMapperError quando o metodo getAllMovies for chamado ', () {
      when(() => http.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenAnswer((_) async => ResponseHttpService(jsonError));

      final response = datasource.getAllMovies(page);

      expect(response, throwsA(isA<MovieMapperError>()));
    });
  });

  group('testes metodo searchMovies', () {
    test('Deve retornar uma lista de MovieEntity quando o metodo searchMovies for chamado ', () async {
      when(() => http.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenAnswer((_) async => ResponseHttpService(json));

      final response = await datasource.searchMovies(paran);

      expect(response, isA<List<MovieEntity>>());
    });
    test('Deve retornar uma Failure quando o metodo searchMovies for chamado ', () {
      when(() => http.get(any(), queryParameters: any(named: 'queryParameters'))).thenThrow(ServiceError(message: ''));

      final response = datasource.searchMovies(paran);

      expect(response, throwsA(isA<Failure>()));
    });
    test('Deve retornar uma MovieMapperError quando o metodo searchMovies for chamado ', () {
      when(() => http.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenAnswer((_) async => ResponseHttpService(jsonError));

      final response = datasource.getAllMovies(page);

      expect(response, throwsA(isA<MovieMapperError>()));
    });
  });

  group('testes metodo getSimilarMovies', () {
    test('Deve retornar uma lista de MovieEntity quando o metodo getSimilarMovies for chamado ', () async {
      when(() => http.get(any())).thenAnswer((_) async => ResponseHttpService(json));

      final response = await datasource.getSimilarMovies(0);

      expect(response, isA<List<MovieEntity>>());
    });
    test('Deve retornar uma Failure quando o metodo getSimilarMovies for chamado ', () {
      when(() => http.get(any())).thenThrow(ServiceError(message: ''));

      final response = datasource.getSimilarMovies(0);

      expect(response, throwsA(isA<Failure>()));
    });
    test('Deve retornar uma MovieMapperError quando o metodo getSimilarMovies for chamado ', () {
      when(() => http.get(any())).thenAnswer((_) async => ResponseHttpService(jsonError));

      final response = datasource.getSimilarMovies(0);

      expect(response, throwsA(isA<MovieMapperError>()));
    });
  });
}

final jsonError = {
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/sd4xN5xi8tKRPrJOWwNiZEile7f.jpg",
      "genre_ids": [16, 12, 35, 10751],
      "id": 92.0,
      "original_language": "en",
      "original_title": "Cars",
      "overview":
          "Ao viajar para a Califórnia, o famoso carro de corridas Relâmpago McQueen se perde e vai parar em Radiator Springs, uma cidadezinha na Rota 66. Ele conhece novos amigos e aprende lições que mudam sua forma de encarar a vida.",
      "popularity": 147.217,
      "poster_path": "/2nM2NRV8wt3n3ffoHQ3KdMkY3vR.jpg",
      "release_date": "2006-06-08",
      "title": "Carros",
      "video": false,
      "vote_average": 6.9,
      "vote_count": 11901
    },
    {
      "adult": false,
      "backdrop_path": "/4mlS1MitcOqdPLhxEFyk9Qwf5rr.jpg",
      "genre_ids": [16, 12, 35, 10751],
      "id": 260514,
      "original_language": "en",
      "original_title": "Cars 3",
      "overview":
          "Durante mais uma disputa eletrizante nas pistas, o campeão Relâmpago McQueen acelerou demais e acabou perdendo o controle. Agora, após ter capotando várias vezes e quase ter partido dessa para melhor, o vermelhinho vai ter sua vida alterada para sempre. O acidente foi tão grave que, com os estragos, McQueen pode ter que se aposentar de vez.",
      "popularity": 212.093,
      "poster_path": "/lVPFdORefTKXKFiSktrXbiFDNAK.jpg",
      "release_date": "2017-06-15",
      "title": "Carros 3",
      "video": false,
      "vote_average": 6.8,
      "vote_count": 4673
    },
    {
      "adult": false,
      "backdrop_path": "/jrlq8lWxB3OKjKwJ0kCjtg5fIII.jpg",
      "genre_ids": [16, 10751, 12, 35],
      "id": 49013,
      "original_language": "en",
      "original_title": "Cars 2",
      "overview":
          "O astro das corridas, Relâmpago McQueen, e o carro-guincho, Mate, viajam para disputar o primeiro Grand Prix Mundial, que irá revelar o carro mais veloz do planeta. Nessa jornada imperdível, Mate se envolve com um grupo de espionagem e vive grandes aventuras com seus amigos.",
      "popularity": 184.476,
      "poster_path": "/fIKaabvE40T39nOIngcZPcPJeYe.jpg",
      "release_date": "2011-06-11",
      "title": "Carros 2",
      "video": false,
      "vote_average": 6,
      "vote_count": 6448
    },
    {
      "adult": false,
      "backdrop_path": "/xZ1M2rKJbXyedJMTIpMNqRlhY36.jpg",
      "genre_ids": [],
      "id": 485621,
      "original_language": "en",
      "original_title": "Cars D'oeuvres",
      "overview": "",
      "popularity": 63.155,
      "poster_path": "/ppqxzUP0XmllXD8bQGmggY6hCEL.jpg",
      "release_date": "2017-11-07",
      "title": "Cars D'oeuvres",
      "video": false,
      "vote_average": 7.4,
      "vote_count": 7
    },
    {
      "adult": false,
      "backdrop_path": "/7pheh4dRDkwi0Fq963zHWRQz9RN.jpg",
      "genre_ids": [],
      "id": 811913,
      "original_language": "en",
      "original_title": "Cars",
      "overview": "",
      "popularity": 58.289,
      "poster_path": "/q6cF3LzBgPJghOb1UQHUGD8v8Hg.jpg",
      "release_date": "1979-01-01",
      "title": "Cars",
      "video": false,
      "vote_average": 0,
      "vote_count": 0
    },
    {
      "adult": false,
      "backdrop_path": "/cNA5G0sp1mHPmOC55WxT5L3m1P7.jpg",
      "genre_ids": [16, 35, 10751],
      "id": 438788,
      "original_language": "en",
      "original_title": "Cars Toon Mater's Tall Tales",
      "overview":
          "Turbine seus motores para esta coleção de CARS TOON estrelado por Mate, o adorável e hilário guincho de Carros. Das mentes criativas da Disney Pixar chegam nove histórias superdivertidas envolvendo touradas, corridas, shows de rock, apresentações de caminhões-monstro e até OVNIs – e ainda veja os novos curtas Mate, O Detetive e Mate Lunático.",
      "popularity": 151.041,
      "poster_path": "/bPQ7ExiKJ5zJKhw6Ya8vqcT7r9c.jpg",
      "release_date": "2008-10-27",
      "title": "Carros - As Grandes Histórias do Mate",
      "video": true,
      "vote_average": 6.6,
      "vote_count": 93
    },
  ]
};
final json = {
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/sd4xN5xi8tKRPrJOWwNiZEile7f.jpg",
      "genre_ids": [16, 12, 35, 10751],
      "id": 920,
      "original_language": "en",
      "original_title": "Cars",
      "overview":
          "Ao viajar para a Califórnia, o famoso carro de corridas Relâmpago McQueen se perde e vai parar em Radiator Springs, uma cidadezinha na Rota 66. Ele conhece novos amigos e aprende lições que mudam sua forma de encarar a vida.",
      "popularity": 147.217,
      "poster_path": "/2nM2NRV8wt3n3ffoHQ3KdMkY3vR.jpg",
      "release_date": "2006-06-08",
      "title": "Carros",
      "video": false,
      "vote_average": 6.9,
      "vote_count": 11901
    },
    {
      "adult": false,
      "backdrop_path": "/4mlS1MitcOqdPLhxEFyk9Qwf5rr.jpg",
      "genre_ids": [16, 12, 35, 10751],
      "id": 260514,
      "original_language": "en",
      "original_title": "Cars 3",
      "overview":
          "Durante mais uma disputa eletrizante nas pistas, o campeão Relâmpago McQueen acelerou demais e acabou perdendo o controle. Agora, após ter capotando várias vezes e quase ter partido dessa para melhor, o vermelhinho vai ter sua vida alterada para sempre. O acidente foi tão grave que, com os estragos, McQueen pode ter que se aposentar de vez.",
      "popularity": 212.093,
      "poster_path": "/lVPFdORefTKXKFiSktrXbiFDNAK.jpg",
      "release_date": "2017-06-15",
      "title": "Carros 3",
      "video": false,
      "vote_average": 6.8,
      "vote_count": 4673
    },
    {
      "adult": false,
      "backdrop_path": "/jrlq8lWxB3OKjKwJ0kCjtg5fIII.jpg",
      "genre_ids": [16, 10751, 12, 35],
      "id": 49013,
      "original_language": "en",
      "original_title": "Cars 2",
      "overview":
          "O astro das corridas, Relâmpago McQueen, e o carro-guincho, Mate, viajam para disputar o primeiro Grand Prix Mundial, que irá revelar o carro mais veloz do planeta. Nessa jornada imperdível, Mate se envolve com um grupo de espionagem e vive grandes aventuras com seus amigos.",
      "popularity": 184.476,
      "poster_path": "/fIKaabvE40T39nOIngcZPcPJeYe.jpg",
      "release_date": "2011-06-11",
      "title": "Carros 2",
      "video": false,
      "vote_average": 6,
      "vote_count": 6448
    },
    {
      "adult": false,
      "backdrop_path": "/xZ1M2rKJbXyedJMTIpMNqRlhY36.jpg",
      "genre_ids": [],
      "id": 485621,
      "original_language": "en",
      "original_title": "Cars D'oeuvres",
      "overview": "",
      "popularity": 63.155,
      "poster_path": "/ppqxzUP0XmllXD8bQGmggY6hCEL.jpg",
      "release_date": "2017-11-07",
      "title": "Cars D'oeuvres",
      "video": false,
      "vote_average": 7.4,
      "vote_count": 7
    },
    {
      "adult": false,
      "backdrop_path": "/7pheh4dRDkwi0Fq963zHWRQz9RN.jpg",
      "genre_ids": [],
      "id": 811913,
      "original_language": "en",
      "original_title": "Cars",
      "overview": "",
      "popularity": 58.289,
      "poster_path": "/q6cF3LzBgPJghOb1UQHUGD8v8Hg.jpg",
      "release_date": "1979-01-01",
      "title": "Cars",
      "video": false,
      "vote_average": 0,
      "vote_count": 0
    },
    {
      "adult": false,
      "backdrop_path": "/cNA5G0sp1mHPmOC55WxT5L3m1P7.jpg",
      "genre_ids": [16, 35, 10751],
      "id": 438788,
      "original_language": "en",
      "original_title": "Cars Toon Mater's Tall Tales",
      "overview":
          "Turbine seus motores para esta coleção de CARS TOON estrelado por Mate, o adorável e hilário guincho de Carros. Das mentes criativas da Disney Pixar chegam nove histórias superdivertidas envolvendo touradas, corridas, shows de rock, apresentações de caminhões-monstro e até OVNIs – e ainda veja os novos curtas Mate, O Detetive e Mate Lunático.",
      "popularity": 151.041,
      "poster_path": "/bPQ7ExiKJ5zJKhw6Ya8vqcT7r9c.jpg",
      "release_date": "2008-10-27",
      "title": "Carros - As Grandes Histórias do Mate",
      "video": true,
      "vote_average": 6.6,
      "vote_count": 93
    },
  ]
};
