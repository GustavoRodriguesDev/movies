import 'package:flutter/material.dart';
import '../../../modules/home/subpage/details_movie.dart';
import '../componentes/image_postar.dart';
import '../componentes/star_rating.dart';

class MovieCard extends StatelessWidget {
  final String pathImage;
  final String nameMovie;
  final double ratingMovie;
  final String imageBackgroud;
  final int votes;
  final String description;
  const MovieCard({
    Key? key,
    required this.pathImage,
    required this.nameMovie,
    required this.ratingMovie,
    required this.imageBackgroud,
    required this.votes,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 800),
            pageBuilder: (context, animation, animationTwo) => DetailsMovie(
              imageBackgroud: imageBackgroud,
              pathImage: pathImage,
              nameMovie: nameMovie,
              rating: ratingMovie,
              votes: votes,
              description: description,
            ),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              const curve = Curves.fastOutSlowIn;
              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImagePoster(
            pathImage: pathImage,
          ),
          Padding(
            padding: EdgeInsets.all(width * 0.015),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: height * 0.04,
                  child: Text(
                    nameMovie,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.04,
                    ),
                  ),
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return StarRating(
                      rating: ratingMovie,
                      width: width * 0.306,
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
