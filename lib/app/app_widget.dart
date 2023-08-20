import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:movies/app/get_it.dart';

import 'modules/home/home_page.dart';
import 'modules/home/store/home_store.dart';

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
        textTheme: GoogleFonts.robotoTextTheme(Typography.whiteMountainView),
        colorScheme: ColorsSchemeCustom.colorScheme,
        useMaterial3: true,
      ),
      title: 'Movies',
      home: HomePage(
        homeStore: getIt<HomeStore>(),
      ),
    );
  }
}
