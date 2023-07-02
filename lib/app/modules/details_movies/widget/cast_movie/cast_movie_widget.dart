import 'package:flutter/material.dart';
import 'package:movies/app/modules/cast/interactor/state/cast_state.dart';
import 'package:movies/app/modules/details_movies/widget/cast_movie/cast_movie_store/cast_movie_store.dart';

import '../../../../core/widgets/card/cast_card.dart';
import '../../../../core/widgets/componentes/image_poster.dart';
import '../../../../core/widgets/shimmer/cast_card_shimmer.dart';
import '../../../../core/widgets/shimmer/text_shimmer.dart';
import '../../../../get_it.dart';

class CastMovieWidget extends StatefulWidget {
  final int movieId;
  const CastMovieWidget({
    required this.movieId,
    super.key,
  });

  @override
  State<CastMovieWidget> createState() => _CastMovieWidgetState();
}

class _CastMovieWidgetState extends State<CastMovieWidget> {
  final castMovieStore = getIt<CastMovieStore>();

  @override
  void initState() {
    super.initState();
    castMovieStore.fetchAllActors(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
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
          height: width * 0.42,
          width: width,
          child: ValueListenableBuilder<CastState>(
            valueListenable: castMovieStore,
            builder: (context, value, child) {
              switch (value) {
                case InitCastState():
                  return Container();

                case LoadingCastState():
                  return ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Column(
                          children: [
                            const CastCardShimmer(),
                            SizedBox(height: width * 0.02),
                            const TextShimmer(),
                          ],
                        ),
                      );
                    },
                  );

                case ErrorCastState(failure: final failure):
                  return Text(
                    failure.message,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: width * 0.06,
                    ),
                  );
                case SuccesCastState(listCast: final listCast):
                  return ListView.builder(
                    itemCount: listCast.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final cast = listCast[index];
                      return CastCard(
                        castImage: cast.profilePath,
                        castName: cast.originalName,
                        onTap: cast.profilePath.isEmpty
                            ? null
                            : () {
                                showDialog(
                                  barrierColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      alignment: Alignment.center,
                                      child: ImagePoster(
                                          pathImage: cast.profilePath),
                                    );
                                  },
                                );
                              },
                      );
                    },
                  );
              }
            },
          ),
        ),
      ],
    );
  }
}
