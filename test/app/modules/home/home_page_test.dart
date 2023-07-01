// import 'package:flutter_test/flutter_test.dart';
// import 'package:golden_toolkit/golden_toolkit.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:movies/app/modules/home/home_page.dart';
// import 'package:movies/app/modules/home/store/home_store.dart';
// import 'package:movies/app/modules/home/store/state/home_state.dart';
// import 'package:movies/app/modules/home/subpage/details_movies/store/details_movies_store.dart';
// import 'package:movies/app/modules/movies/domain/entities/movie_entity.dart';
// import 'package:network_image_mock/network_image_mock.dart';

// class HomeStoreMock extends Mock implements HomeStore {}

// class DetaisMoviesStoreMock extends Mock implements DetaisMoviesStore {}

// void main() {
//   late HomeStore homeStore;
//   late DetaisMoviesStore detaisMoviesStore;
//   late List<MovieEntity> listMovies;
//   late MovieEntity movieEntity;
//   setUp(() {
//     homeStore = HomeStoreMock();
//     detaisMoviesStore = DetaisMoviesStoreMock();
//     movieEntity = const MovieEntity(
//       adult: true,
//       voteCount: 12,
//       genreIds: [],
//       movieID: 1,
//       originalTitle: 'teste',
//       releaseDate: '23/10/2021',
//       voteAverage: 2.8,
//       title: 'teste',
//       overview: 'teste teste teste teste',
//       originalLanguage: 'pt/br',
//       popularity: 25,
//       backdropPath: "/2RSirqZG949GuRwN38MYCIGG4Od.jpg",
//       posterPath: "/sjnijtgU3Khzou1S9412V30pP7L.jpg",
//     );

//     listMovies = [
//       movieEntity,
//       movieEntity,
//       movieEntity,
//       movieEntity,
//       movieEntity,
//       movieEntity,
//       movieEntity,
//       movieEntity,
//       movieEntity,
//     ];

//     registerFallbackValue(listMovies);
//   });
//   testGoldens('test da homepage', (tester) async {
//     when(() => homeStore.fetchAllMovies()).thenAnswer((_) async {
//       homeStore.value = SuccesHomeState(listMovies: listMovies);
//     });
//     when(() => homeStore.value)
//         .thenReturn(SuccesHomeState(listMovies: listMovies));

//     // when(() => (homeStore.value as SuccesHomeState).listMovies.length)
//     //     .thenReturn((homeStore.value as SuccesHomeState).listMovies.length);
//     // when(() => (homeStore.value as SuccesHomeState).listMovies[any()])
//     //     .thenReturn(listMovies[1]);

//     await loadAppFonts();

//     final builder = DeviceBuilder()
//       ..addScenario(
//           name: 'home_page',
//           widget: HomePage(
//             homeStore: homeStore,
//             detaisMoviesStore: detaisMoviesStore,
//           ));

//     mockNetworkImagesFor(
//         () => tester.runAsync(() => tester.pumpDeviceBuilder(builder)));

//     await screenMatchesGolden(tester, 'home_page');
//   });
// }
