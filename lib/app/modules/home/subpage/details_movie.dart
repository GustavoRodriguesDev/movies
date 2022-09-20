import 'package:flutter/material.dart';

import '../../../core/constants/movies_api.dart';

class DetailsMovie extends StatefulWidget {
  final String imageBackgroud;
  final String nameMovie;
  final double rating;
  final int votes;
  final String description;
  const DetailsMovie({
    super.key,
    required this.imageBackgroud,
    required this.nameMovie,
    required this.rating,
    required this.votes,
    required this.description,
  });

  @override
  State<DetailsMovie> createState() => _DetailsMovieState();
}

class _DetailsMovieState extends State<DetailsMovie> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: height * 0.35,
                width: width,
                child: Image.network(
                  MovieConstants.image + widget.imageBackgroud,
                  fit: BoxFit.cover,
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
