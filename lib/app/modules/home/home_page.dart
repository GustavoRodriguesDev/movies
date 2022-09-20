import 'package:flutter/material.dart';

import '../../core/constants/movies_api.dart';
import '../../core/widgets/appbar/custom_app_bar.dart';
import '../../core/widgets/card/movie_card.dart';
import '../../core/widgets/card/movie_card_shimmer.dart';
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
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    homeStore.fetchAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
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
                  final imageBackgroud = Image.network(
                    MovieConstants.image + movie.backdropPath,
                    fit: BoxFit.fill,
                  );
                  return MovieCard(
                    ratingMovie: movie.voteAverage.toDouble(),
                    nameMovie: movie.title,
                    pathImage: movie.posterPath,
                    imageBackgroud: imageBackgroud,
                    votes: movie.voteCount,
                    description: movie.overview,
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
