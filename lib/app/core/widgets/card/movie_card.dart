import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../componentes/star_rating.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height * 0.30,
          width: width * 0.45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(width * 0.05)),
              image: const DecorationImage(
                  image: NetworkImage(
                      'https://img.elo7.com.br/product/original/2692931/big-poster-o-senhor-dos-aneis-o-retorno-do-rei-lo07-90x60-cm-poster.jpg'),
                  fit: BoxFit.fill)),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'O senhor dos Anais',
                style: TextStyle(color: Colors.white),
              ),
              StarRating(),
            ],
          ),
        )
      ],
    );
  }
}
