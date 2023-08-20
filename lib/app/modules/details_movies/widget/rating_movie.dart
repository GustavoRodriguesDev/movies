import 'package:flutter/material.dart';

class RatingMovie extends StatelessWidget {
  final double rating;
  final int votes;
  const RatingMovie({Key? key, required this.rating, required this.votes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        Text(
          '$rating ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: width * 0.05,
          ),
        ),
        Text(
          '| $votes',
          style: TextStyle(
            fontSize: width * 0.04,
          ),
        )
      ],
    );
  }
}
