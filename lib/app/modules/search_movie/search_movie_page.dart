import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../get_it.dart';
import '../../shared/constants/movies_api.dart';
import '../details_movies/details_movie_page.dart';
import '../details_movies/store/details_movies_store.dart';
import 'store/search_movie_store.dart';
import 'store/state/search_state.dart';

class SearchMoviePage extends StatefulWidget {
  final SearchMovieStore store;
  const SearchMoviePage({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  State<SearchMoviePage> createState() => _SearchMoviePageState();
}

class _SearchMoviePageState extends State<SearchMoviePage> {
  final TextEditingController search = TextEditingController();
  SearchMovieStore get store => widget.store;

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            title: const Text('Buscar Filme'),
            collapsedHeight: 120,
            flexibleSpace: FlexibleSpaceBar(
              title: Stack(
                alignment: Alignment.center,
                children: [
                  TextFormField(
                    controller: search,
                    onEditingComplete: () => store.searchMovie(search.text),
                    decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(),
                        hintText: 'Encontre seus filmes favoritos',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                  ),
                  Positioned(
                    right: 2,
                    child: IconButtonCuston(
                      iconData: Icons.search,
                      size: 40,
                      onTap: () {
                        store.searchMovie(search.text);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 14, right: 14, top: 6),
            sliver: ValueListenableBuilder<SearchState>(
              valueListenable: store,
              builder: (context, value, child) {
                if (value is LoadingSearchState) {
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
                }
                if (value is ErrorSearchState) {
                  return Center(
                      child: Text(
                    value.error.message,
                  ));
                }
                if (value is EmptySearchState) {
                  return SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const SizedBox(height: 150),
                        const Icon(
                          Icons.local_movies_rounded,
                          size: 120,
                        ),
                        Text(
                          'Não achamos um filme relacionado com ${search.text}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                if (value is SuccessSearchState) {
                  return SliverGrid.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.52,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                    ),
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
                              detaisMoviesStore: getIt<DetaisMoviesStore>(),
                              movieId: movie.movieID,
                            ),
                          );
                        },
                      );
                    },
                  );
                }
                return const SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 150),
                      Icon(
                        Icons.local_movies_rounded,
                        size: 120,
                      ),
                      Text(
                        'Experimente buscar pelo seu filme favorito',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
