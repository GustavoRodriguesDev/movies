import 'package:flutter/material.dart';
import '../../core/constants/movies_api.dart';
import '../../core/widgets/appbar/custom_app_bar.dart';
import '../../core/widgets/card/movie_card.dart';
import '../../core/widgets/shimmer/movie_card_shimmer.dart';
import '../../core/widgets/navigator/custom_navigator.dart';
import '../../get_it.dart';
import 'store/home_store.dart';
import 'store/state/home_state.dart';
import '../details_movies/details_movie_page.dart';
import '../details_movies/store/details_movies_store.dart';
import '../search_movie/search_movie_page.dart';
import '../search_movie/store/search_movie_store.dart';

class HomePage extends StatefulWidget {
  final HomeStore homeStore;
  final DetaisMoviesStore detaisMoviesStore;
  const HomePage(
      {Key? key, required this.homeStore, required this.detaisMoviesStore})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore get homeStore => widget.homeStore;
  DetaisMoviesStore get detaisMoviesStore => widget.detaisMoviesStore;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    homeStore.fetchAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onPressed: () {
        CustomNavigator.pushSlidesTransition(
          context,
          SearchMoviePage(store: getIt<SearchMovieStore>()),
        );
      }),
      body: Padding(
        padding: const EdgeInsets.only(left: 14, right: 14, top: 6),
        child: ValueListenableBuilder<HomeState>(
          valueListenable: homeStore,
          builder: ((context, value, child) {
            if (value is LoadingHomeState) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                ),
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return const Center(
                    child: MovieCardShimmer(),
                  );
                },
              );
            }
            if (value is ErrorHomeState) {
              return Text(value.error.message);
            }
            if (value is SuccesHomeState) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.52,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                ),
                shrinkWrap: true,
                itemCount: value.listMovies.length,
                itemBuilder: (context, index) {
                  final movie = value.listMovies[index];
                  precacheImage(
                      Image.network(ApiConstants.image + movie.backdropPath)
                          .image,
                      context);
                  return MovieCard(
                    ratingMovie: movie.voteAverage.toDouble(),
                    nameMovie: movie.title,
                    pathImage: movie.posterPath,
                    onTap: () {
                      CustomNavigator.pushSlidesTransition(
                        context,
                        DetailsMovie(
                          imagePoster: movie.posterPath,
                          imageBackgroud: movie.backdropPath,
                          nameMovie: movie.title,
                          rating: movie.voteAverage.toDouble(),
                          votes: movie.voteCount,
                          description: movie.overview,
                          detaisMoviesStore: detaisMoviesStore,
                          movieId: movie.movieID,
                        ),
                      );
                    },
                  );
                },
              );
            }
            return Container();
          }),
        ),
      ),
    );
  }
}
