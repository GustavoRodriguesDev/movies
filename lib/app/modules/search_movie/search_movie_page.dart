import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:movies/app/modules/details_movies/details_movie_page.dart';

import '../../shared/constants/movies_api.dart';
import '../../get_it.dart';
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.only(top: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: width * 0.08,
              ),
              IconButtonCuston(
                size: width * .12,
                color: Colors.transparent,
                iconData: Icons.arrow_back_ios_new_rounded,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 15),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color: Colors.white.withOpacity(0.1),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: search,
                      onEditingComplete: () => store.searchMovie(search.text),
                      decoration: InputDecoration(
                          focusedBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          focusColor: Colors.white,
                          fillColor: Colors.white,
                          hintText: 'Encontre seus filmes favoritos',
                          hintStyle:
                              TextStyle(color: Colors.white.withOpacity(0.5)),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10)),
                      cursorColor: Colors.white,
                    ),
                  ),
                  Positioned(
                    right: 2,
                    child: IconButtonCuston(
                      size: width * 0.11,
                      iconData: Icons.search,
                      onTap: () {
                        store.searchMovie(search.text);
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, right: 14, top: 6),
                child: ValueListenableBuilder<SearchState>(
                  valueListenable: store,
                  builder: ((context, value, child) {
                    if (value is LoadingSearchState) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                    if (value is ErrorSearchState) {
                      return Text(value.error.message);
                    }
                    if (value is EmptySearchState) {
                      return Center(
                        child: SizedBox(
                          child: Column(
                            children: [
                              SizedBox(height: width * .2),
                              Icon(
                                Icons.local_movies_rounded,
                                size: width * 0.25,
                                color: Colors.white.withOpacity(0.5),
                              ),
                              SizedBox(height: width * .1),
                              Text(
                                'Não achamos um filme relacionado com ${search.text}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    if (value is SuccessSearchState) {
                      return SizedBox(
                        height: height * 0.795,
                        width: width,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.52,
                            crossAxisSpacing: 10,
                            crossAxisCount: 2,
                          ),
                          shrinkWrap: true,
                          itemCount: value.listMovies.length,
                          itemBuilder: (context, index) {
                            final movie = value.listMovies[index];
                            precacheImage(
                                Image.network(
                                        ApiConstants.image + movie.backdropPath)
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
                                    detaisMoviesStore:
                                        getIt<DetaisMoviesStore>(),
                                    movieId: movie.movieID,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      );
                    }
                    return Center(
                      child: SizedBox(
                        child: Column(
                          children: [
                            SizedBox(height: width * .2),
                            Icon(
                              Icons.local_movies_rounded,
                              size: width * 0.25,
                              color: Colors.white.withOpacity(0.5),
                            ),
                            SizedBox(height: width * .1),
                            Text(
                              'Experimente buscar pelo seu filme favorito',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
