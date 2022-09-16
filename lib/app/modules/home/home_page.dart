import 'package:flutter/material.dart';

import '../../core/widgets/appbar/custom_app_bar.dart';
import '../../core/widgets/card/movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
          padding: EdgeInsets.only(left: 14, right: 14, top: 6),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 9,
            itemBuilder: (context, index) {
              return MovieCard(
                ratingMovie: 5,
                nameMovie: '',
                pathImage: '',
              );
            },
          )),
    );
  }
}
