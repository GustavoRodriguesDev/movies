import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RatingMovie extends StatelessWidget {
  final double rating;
  final int votes;
  const RatingMovie({Key? key, required this.rating, required this.votes}) : super(key: key);

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
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: width * 0.05,
          ),
        ),
        Text(
          '| $votes',
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: width * 0.04,
          ),
        )
      ],
    );
  }
}
