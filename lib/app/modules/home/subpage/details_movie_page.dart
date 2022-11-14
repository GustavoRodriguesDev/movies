import 'package:flutter/material.dart';

import 'package:movies/app/modules/home/subpage/store/details_movies_store.dart';

import '../../../core/constants/movies_api.dart';
import '../../../core/widgets/shimmer/cast_card_shimmer.dart';
import 'store/state/state_details_movies.dart';

class DetailsMovie extends StatefulWidget {
  final String imageBackgroud;
  final String nameMovie;
  final double rating;
  final int votes;
  final String description;
  final DetaisMoviesStore detaisMoviesStore;
  final int movieId;
  const DetailsMovie({
    Key? key,
    required this.imageBackgroud,
    required this.nameMovie,
    required this.rating,
    required this.votes,
    required this.description,
    required this.detaisMoviesStore,
    required this.movieId,
  }) : super(key: key);

  @override
  State<DetailsMovie> createState() => _DetailsMovieState();
}

class _DetailsMovieState extends State<DetailsMovie> {
  DetaisMoviesStore get detaisMoviesStore => widget.detaisMoviesStore;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    detaisMoviesStore.fetchAllActors(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: height * 0.35,
                  width: width,
                  child: Image.network(
                    ApiConstants.image + widget.imageBackgroud,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                          child: Text(
                        'Image not found',
                        style: TextStyle(color: Colors.white),
                      ));
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: height * 0.15,
                    width: width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          const Color(0xFF1B2230),
                          const Color(0xFF1B2230).withOpacity(0.2),
                          Colors.transparent,
                        ],
                        stops: const [0.0, 0.6, 1],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.05,
                  left: width * 0.83,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: width * 0.1,
                      width: width * 0.1,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Icon(
                        Icons.close_rounded,
                        size: width * 0.08,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        '${widget.rating} ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.05,
                        ),
                      ),
                      Text(
                        '| ${widget.votes}',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: width * 0.04,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: width * 0.04),
                  Text(
                    widget.nameMovie,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.06,
                    ),
                  ),
                  SizedBox(height: width * 0.04),
                  Text(
                    widget.description,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: width * 0.04,
                    ),
                  ),
                  SizedBox(height: width * 0.04),
                  Text(
                    'Elenco',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.06,
                    ),
                  ),
                  SizedBox(height: width * 0.04),
                  SizedBox(
                    height: 165,
                    width: width,
                    child: ValueListenableBuilder<DetailsMoviesState>(
                      valueListenable: detaisMoviesStore,
                      builder: (context, value, child) {
                        if (value is LoadingDetailsMoviesState) {
                          SizedBox(
                            height: 90,
                            child: ListView.builder(
                              itemCount: 5,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return const Center(child: CastCardShimmer());
                              },
                            ),
                          );
                        }
                        if (value is ErrorDetailsMoviesState) {}
                        if (value is SuccessDetailsMoviesState) {
                          return ListView.builder(
                            itemCount: value.listCast.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final cast = value.listCast[index];
                              return Column(
                                children: [
                                  Container(
                                    height: 90,
                                    width: 90,
                                    margin: const EdgeInsets.symmetric(horizontal: 6),
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(shape: BoxShape.circle),
                                    child: Image.network(
                                      ApiConstants.image + cast.profilePath,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return const Center(
                                            child: Text(
                                          'Image not found',
                                          style: TextStyle(color: Colors.white),
                                        ));
                                      },
                                      loadingBuilder: (_, widget, image) {
                                        if (image == null) {
                                          return widget;
                                        }

                                        return const CastCardShimmer();
                                      },
                                    ),
                                  ),
                                  SizedBox(height: width * 0.02),
                                  SizedBox(
                                    width: 90,
                                    child: Text(
                                      cast.originalName,
                                      // overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontSize: width * 0.04,
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
