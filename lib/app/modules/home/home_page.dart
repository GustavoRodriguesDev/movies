import 'package:flutter/material.dart';

import '../../core/constants/movies_api.dart';
import '../../core/widgets/appbar/custom_app_bar.dart';
import '../../core/widgets/card/movie_card.dart';
import '../../core/widgets/carousel/banner_carousel_widget.dart';
import '../../core/widgets/carousel/carousel_widget.dart';
import '../../core/widgets/navigator/custom_navigator.dart';
import '../../core/widgets/shimmer/carousel_shimmer.dart';
import '../../core/widgets/shimmer/movie_card_shimmer.dart';
import '../../get_it.dart';
import '../details_movies/details_movie_page.dart';
import '../details_movies/store/details_movies_store.dart';
import '../search_movie/search_movie_page.dart';
import '../search_movie/store/search_movie_store.dart';
import 'store/home_store.dart';
import 'store/state/home_state.dart';

class HomePage extends StatefulWidget {
  final HomeStore homeStore;

  const HomePage({
    Key? key,
    required this.homeStore,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore get homeStore => widget.homeStore;
  late ScrollController scrollController;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    homeStore.fetchAllMovies();

    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            onPressed: () {
              CustomNavigator.pushSlidesTransition(
                context,
                SearchMoviePage(store: getIt<SearchMovieStore>()),
              );
            },
          ),
          SliverToBoxAdapter(
            child: ValueListenableBuilder<HomeState>(
              valueListenable: homeStore,
              builder: (context, value, child) {
                switch (value) {
                  case EmpityHomeState():
                    return const SizedBox();

                  case LoadingHomeState():
                    return const CarouselShimmer();

                  case ErrorHomeState(error: var error):
                    return Text(error.message);

                  case SuccesHomeState(listMovies: var listMovies):
                    return CarouselWidget(
                      widgets: listMovies
                          .map(
                            (movie) => BannerCarousel(
                              movie: movie,
                            ),
                          )
                          .toList(),
                    );
                }
                return const SizedBox();
              },
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 14, right: 14),
            sliver: ValueListenableBuilder<HomeState>(
              valueListenable: homeStore,
              builder: (context, value, child) {
                switch (value) {
                  case EmpityHomeState():
                    return const SizedBox();

                  case LoadingHomeState():
                    return SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.65,
                        crossAxisSpacing: 10,
                        crossAxisCount: 2,
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return const Center(
                          child: MovieCardShimmer(),
                        );
                      },
                    );

                  case ErrorHomeState(error: var error):
                    return Text(error.message);

                  case SuccesHomeState(listMovies: var listMovies):
                    return SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.52,
                        crossAxisSpacing: 10,
                        crossAxisCount: 2,
                      ),
                      itemCount: listMovies.length,
                      itemBuilder: (context, index) {
                        final movie = listMovies[index];
                        precacheImage(
                          Image.network(ApiConstants.image + movie.backdropPath)
                              .image,
                          context,
                        );
                        return MovieCard(
                          ratingMovie: movie.voteAverage.toDouble(),
                          nameMovie: movie.title,
                          pathImage: movie.posterPath,
                          onTap: () async {
                            await CustomNavigator.pushSlidesTransition(
                              context,
                              DetailsMovie(
                                detaisMoviesStore: getIt<DetaisMoviesStore>(),
                                imagePoster: movie.posterPath,
                                imageBackgroud: movie.backdropPath,
                                nameMovie: movie.title,
                                rating: movie.voteAverage.toDouble(),
                                votes: movie.voteCount,
                                description: movie.overview,
                                movieId: movie.movieID,
                              ),
                            );
                          },
                        );
                      },
                    );
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
