import 'package:flutter/material.dart';
import 'package:movies/app/get_it.dart';
import 'modules/home/home_page.dart';
import 'modules/home/store/home_store.dart';
import 'modules/home/subpage/details_movies/store/details_movies_store.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF1B2230),
      ),
      title: 'Movies',
      home: HomePage(
          homeStore: getIt<HomeStore>(),
          detaisMoviesStore: getIt<DetaisMoviesStore>()),
    );
  }
}
