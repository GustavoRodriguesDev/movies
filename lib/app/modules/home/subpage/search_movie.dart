import 'package:flutter/material.dart';
import '../../../core/widgets/button/icon_button_custon.dart';

class SearchMoviePage extends StatefulWidget {
  const SearchMoviePage({Key? key}) : super(key: key);

  @override
  State<SearchMoviePage> createState() => _SearchMoviePageState();
}

class _SearchMoviePageState extends State<SearchMoviePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.only(top: 25),
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
                    decoration: InputDecoration(
                        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                        focusColor: Colors.white,
                        fillColor: Colors.white,
                        hintText: 'Encontre seus filmes favoritos',
                        hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10)),
                    cursorColor: Colors.white,
                  ),
                ),
                Positioned(
                  right: 2,
                  child: IconButtonCuston(
                    size: width * 0.11,
                    iconData: Icons.search,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
